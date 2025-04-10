= Key Generator

== Description

The key generator (also called _keygen_, or the _auxiliary application_) is a simple application for generating a set of RSA keys, with the private one being encrypted, all of which are stored on a USB pendrive. These keys are to be later used by the _Signer_, the main application of the project.

== Functionality Overview

The application starts in a key generation mode, allowing the user to change the directory to which pendrives are mounted, pick them out, as well as fill out any details regarding the key they'd like to create.

#figure(
  image("../images/keygen_default.png"),
  caption: "Key generator application after starting."
)

Due to the application being primarily developed for a specific device and needing to be presented on it, the media location already reflects the one on said PC.
The user is allowed to change it, but should the path not exist, the application will notify of such fact.

#figure(
  image("../images/keygen_no_media_path.png", width: 75%),
  caption: "Key generator application with a non-existing media path."
)

Assuming the path is correct, the user can pick a pendrive from the list of available devices. 
Any pendrive connected to the device will be selected by default.

#figure(
  image("../images/keygen_media_list.png"),
  caption: "Key generator application with a list of available devices."
)

Should there be no devices available, the list will appear empty.

The details of the key to be generated can be filled out in the form below, which is agnostic to the device.
This is to allow the user to easily switch the device used, in case of a mistaken insertion.
By default the application says that the key must have a name and a password for the encryption of the private key.
Should the user fix those issues, the button to generate the key will become active, assuming a pendrive has also been selected.

#figure(
  image("../images/keygen_filled_out.png", width: 80%),
  caption: "Key generator application with the form filled out."
)

The user is allowed to customise the size of the key they are creating, should the default size of 4096 not be satisfactory.
At the same time, the value put in is required to be an integer divisible by 512, otherwise the application will not allow the user to generate a key, providing them with an appropriate message.

#figure(
  image("../images/keygen_size_not_int.png", width: 80%),
  caption: "Key generator application when the custom size is not an integer."
)

#figure(
  image("../images/keygen_size_not_divisible.png", width: 80%),
  caption: "Key generator application when the custom size is not divisible by 512."
)

Once all the values have been entered and the _Generate Key_ button is clickable, the user may press it to begin the key generation process.
To signify the fact that the key is being generated, an appropriate message appears instantly after the button being pressed.
This is to make sure that even on a low-end machine generating a large key, the end user is aware of the state of the application.

#figure(
  image("../images/keygen_generating.png", width: 80%),
  caption: "Key generator application generating a key."
)

Depending on the specs of the machine running this application as well as how large a key the user wishes to generate, this process could take up to several minutes.
Once the process has finished, the user is told of the fact through a pop-up-window.

#figure(
  image("../images/keygen_success_popup.png", width: 80%),
  caption: "Key generator application post-generation success popup."
)

Once the user confirms this fact, the application will return to its previous state, all of its details still filled out, in case the user wishes to generate multiple somewhat similar keys.
At the same time, the possibility of generating a key with the same name is locked, with the application providing an appropriate message as to why.

#figure(
  image("../images/keygen_post_generation.png", width: 80%),
  caption: "Key generator application blocking next key generation due to already having a key with the provided name."
)

As a result of the key generation, a hidden directory dedicated to the application is created on the connected pendrive.
In it, a directory for the specific generated key containing every detail necessary for loading either the encrypted, private key, or public key is made.

#figure(
  image("../images/key_structure.png", width: 78%),
  caption: "Generated key folder structure."
)

The saved key generated by the application is encrypted using RSA, thus being entirely illegible to anyone trying to open it in a standard text editor.

#figure(
  image("../images/encrypted_private_key.png", width: 80%),
  caption: "Private key saved on the pendrive, opened in VS Code."
)

Once the key is saved, it also appears in the list of keys available to be managed.

#figure(
  image("../images/keygen_management.png", width: 100%),
  caption: "Key generator management tab."
)

It is possible to export the public key, for example, to share with someone else, to check the password (to ensure the user still remembers) it, as well as to delete a key that's no longer needed.

If the user chooses to export the public key, they will be prompted to select the location to save the public key to.

#figure(
  image("../images/keygen_save_key.png", width: 80%),
  caption: "Key location saving window."
)

The public key is saved in a standard PEM format, making it easy to read in case something went wrong, which hopefully will not be necessary.

Should the user choose to verify the password of the key, an appropriate prompt will appear.

// == Implementation