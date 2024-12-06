package com.isteer.utils;


import com.azure.identity.ClientSecretCredential;
import com.azure.identity.ClientSecretCredentialBuilder;
import com.azure.identity.DefaultAzureCredentialBuilder;
import com.azure.security.keyvault.keys.KeyClient;
import com.azure.security.keyvault.keys.KeyClientBuilder;
import com.azure.security.keyvault.keys.cryptography.CryptographyClient;
import com.azure.security.keyvault.keys.cryptography.CryptographyClientBuilder;
import com.azure.security.keyvault.keys.cryptography.models.DecryptResult;
import com.azure.security.keyvault.keys.cryptography.models.EncryptResult;
import com.azure.security.keyvault.keys.cryptography.models.EncryptionAlgorithm;
import com.azure.security.keyvault.keys.models.KeyVaultKey;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.util.Base64;

@Service
public class AkvUtils{

    private final CryptographyClient cryptoClient;

    public AkvUtils(@Value("${key.vault.key-namee}") String keyName,
                    @Value("${azure.keyvault.uri}") String keyVaultUri) {
        KeyClient keyClient = new KeyClientBuilder()
                .vaultUrl(keyVaultUri)
                .credential(new DefaultAzureCredentialBuilder().build())
                .buildClient();

        KeyVaultKey key = keyClient.getKey(keyName);
        this.cryptoClient = new CryptographyClientBuilder()
                .keyIdentifier(key.getId())
                .credential(new DefaultAzureCredentialBuilder().build())
                .buildClient();
    }


    public String encryptData(String data) {
        EncryptResult encryptResult = cryptoClient.encrypt(EncryptionAlgorithm.RSA_OAEP, data.getBytes());
        byte[] cipherText = encryptResult.getCipherText();
        return Base64.getEncoder().encodeToString(cipherText);
    }

    public String decryptData(String encryptedData) {
        byte[] encryptedSsn = Base64.getDecoder().decode(encryptedData);
        DecryptResult decryptResult = cryptoClient.decrypt(EncryptionAlgorithm.RSA_OAEP, encryptedSsn);
        return new String(decryptResult.getPlainText());
    }


}
