#ifndef BITCOIN_CHAINPARAMSSEEDS_H
#define BITCOIN_CHAINPARAMSSEEDS_H
/**
 * List of fixed seed nodes for the bitcoin network
 * AUTOGENERATED by contrib/seeds/generate-seeds.py
 *
 * Each line contains a 16-byte IPv6 address and a port.
 * IPv4 as well as onion addresses are wrapped inside a IPv6 address accordingly.
 */
 // ***TODO*** fix generate-seeds.py and REGENERATE
static SeedSpec6 pnSeed6_main[] = { 
	{{0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0x9f,0x41,0x72,0x1f}, 9779},
	{{0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,0xff,0xff,0x02,0x3a,0x62,0x3e}, 9779},
};

static SeedSpec6 pnSeed6_test[] = { };

#endif // BITCOIN_CHAINPARAMSSEEDS_H
