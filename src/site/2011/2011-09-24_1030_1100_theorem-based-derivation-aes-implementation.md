- type: talk
- title: Theorem-based derivation of an AES Implementation
- speakers: John Launchbury
- affiliations: Galois
- video: https://www.youtube.com/watch?v=leRZOiD6niY

## Abstract
Even though step-by-step refinement has long been seen as desirable, it is hard to find compelling industrial applications of the technique. In theory, transforming a high-level specification into a high-performance implementation is an ideal means of producing a correct design, but in practice it is hard to make it work, and even harder to make it worthwhile. This talk describes an exception.  We relate a design experience in which theorem-based refinement played a crucial role in producing an industrial quality FPGA encryptor and decryptor for AES. Quite simply, we are unlikely to have succeeded without the technique.
We began with a specification for AES written in Cryptol, a high-level functional language designed specifically for describing the domain of bit-level computations as arise in Cryptography. Over a series of five design stages we were able to produce an industrial grade encrypt core. In each stage, we stated theorems which related the component behaviors in one stage with the corresponding behaviors in the refinement. The resulting cores, running at 350Mhz-440Mhz depending on the FPGA part, bore little relationship to the original, except that the step-by-step theorems ensured we had not gone astray.

The next significant challenge we faced was in performing decrypt. While there are many similarities between encrypt and decrypt in AES, there are some crucial differences with regard to high performance. First concerns the generation of key material. The AES key is used as a seed for a specific pseudo-random number generator which produces key material for use in each of the AES rounds. For encrypt, the key-generator runs in sync with the action of encryption, so may be scheduled alongside it. For decrypt, they run counter to one-another, facing a major challenge to be overcome. Second, the generated key material needs to have an additional transformation applied to it, which occurs deep in the middle of the high performing core.

Using theorems as stepping stones along the way, we redesigned the key expansion algorithm so that it would run in sync with the decryption, and we traced parallel steps to the derivation of encrypt, establishing a commuting ladder diagram along the way. At each barriers in development, we produced many theorems to isolate the bug, using theorems as a principled kind of printf. When the bug was eradicated, we elided many of the temporary theorems, leaving behind those that provided important insights into the behavior of the code.

This talk is a story of the journey with demonstrations of the tool at work. Its ultimate message is to highlight the value of including a theorem facility within purely functional domain-specific languages.
