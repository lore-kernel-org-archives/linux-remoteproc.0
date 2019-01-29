Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail-eopbgr50064.outbound.protection.outlook.com ([40.107.5.64]:61229
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725799AbfA2J1Z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 29 Jan 2019 04:27:25 -0500
From: Peng Fan <peng.fan@nxp.com>
Subject: RE: [Xen-devel] [RFC] virtio_ring: check dma_mem for xen_domain
Date: Tue, 29 Jan 2019 09:26:41 +0000
Message-ID: <AM0PR04MB448123F7FEBCEBD63DE0AF8088970@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190121050056.14325-1-peng.fan@nxp.com>
 <alpine.DEB.2.10.1901221113410.17936@sstabellini-ThinkPad-X260>
 <20190123071232.GA20526@infradead.org>
 <alpine.DEB.2.10.1901230935280.17936@sstabellini-ThinkPad-X260>
 <20190123211405.GA4971@infradead.org>
 <AM0PR04MB4481F3986CFB6D1EF26FA135889B0@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20190128080028.GA18476@infradead.org>
In-Reply-To: <20190128080028.GA18476@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-remoteproc-owner@vger.kernel.org
To: "hch@infradead.org" <hch@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, "mst@redhat.com" <mst@redhat.com>, "jasowang@redhat.com" <jasowang@redhat.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>, "luto@kernel.org" <luto@kernel.org>, "jgross@suse.com" <jgross@suse.com>, "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>, Andy Duan <fugang.duan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogaGNoQGluZnJhZGVhZC5v
cmcgW21haWx0bzpoY2hAaW5mcmFkZWFkLm9yZ10NCj4gU2VudDogMjAxOcTqMdTCMjjI1SAxNjow
MA0KPiBUbzogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+IENjOiBoY2hAaW5mcmFkZWFk
Lm9yZzsgU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsNCj4gbXN0
QHJlZGhhdC5jb207IGphc293YW5nQHJlZGhhdC5jb207IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZzsNCj4gbGludXgtcmVtb3RlcHJvY0B2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5l
bEB2Z2VyLmtlcm5lbC5vcmc7DQo+IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnOyBsdXRvQGtlcm5lbC5vcmc7IGpncm9zc0BzdXNlLmNvbTsNCj4gYm9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb207IEFuZHkgRHVhbiA8ZnVnYW5nLmR1YW5AbnhwLmNvbT4NCj4gU3ViamVj
dDogUmU6IFtYZW4tZGV2ZWxdIFtSRkNdIHZpcnRpb19yaW5nOiBjaGVjayBkbWFfbWVtIGZvciB4
ZW5fZG9tYWluDQo+IA0KPiBPbiBGcmksIEphbiAyNSwgMjAxOSBhdCAwOTo0NToyNkFNICswMDAw
LCBQZW5nIEZhbiB3cm90ZToNCj4gPiBKdXN0IGhhdmUgYSBxdWVzdGlvbiwNCj4gPg0KPiA+IFNp
bmNlIHZtYWxsb2NfdG9fcGFnZSBpcyBvayBmb3IgY21hIGFyZWEsIG5vIG5lZWQgdG8gdGFrZSBj
bWEgYW5kIHBlcg0KPiA+IGRldmljZSBjbWEgaW50byBjb25zaWRlcmF0aW9uIHJpZ2h0Pw0KPiAN
Cj4gVGhlIENNQSBhcmVhIGl0c2VsZiBpdCBhIHBoeXNpY2FsIG1lbW9yeSByZWdpb24uICBJZiBp
dCBpcyBhIG5vbi1oaWdobWVtDQo+IHJlZ2lvbiB5b3UgY2FuIGNhbGwgdmlydF90b19wYWdlIG9u
IHRoZSB2aXJ0dWFsIGFkZHJlc3NlcyBmb3IgaXQuICBJZiBpdCBpcyBpbg0KPiBoaWdobWVtIGl0
IGRvZXNuJ3QgZXZlbiBoYXZlIGEga2VybmVsIHZpcnR1YWwgYWRkcmVzcyBieSBkZWZhdWx0Lg0K
PiANCj4gPiB3ZSBvbmx5IG5lZWQgdG8gaW1wbGVtZW50IGEgcGllY2UgY29kZSB0byBoYW5kbGUg
cGVyIGRldmljZSBzcGVjaWZpYw0KPiA+IHJlZ2lvbiB1c2luZyBSRVNFUlZFRE1FTV9PRl9ERUNM
QVJFLCBqdXN0IGxpa2U6DQo+ID4gUkVTRVJWRURNRU1fT0ZfREVDTEFSRShycG1zZy1kbWEsICJy
cG1zZy1kbWEtcG9vbCIsDQo+ID4gcm1lbV9ycG1zZ19kbWFfc2V0dXApOyBBbmQgaW1wbGVtZW50
IHRoZSBkZXZpY2VfaW5pdCBjYWxsIGJhY2sgYW5kDQo+ID4gYnVpbGQgYSBtYXAgYmV0d2VlbiBw
YWdlIGFuZCBwaHlzLg0KPiA+IFRoZW4gaW4gcnBtc2cgZHJpdmVyLCBzY2F0dGVyIGxpc3QgY291
bGQgdXNlIHBhZ2Ugc3RydWN0dXJlLCBubyBuZWVkDQo+ID4gdm1hbGxvY190b19wYWdlIGZvciBw
ZXIgZGV2aWNlIGRtYS4NCj4gPg0KPiA+IElzIHRoaXMgdGhlIHJpZ2h0IHdheT8NCj4gDQo+IEkg
dGhpbmsgdGhpcyBzaG91bGQgd29yayBmaW5lLiAgSWYgeW91IGhhdmUgdGhlIGN5Y2xlcyBmb3Ig
aXQgSSdkIGFjdHVhbGx5IGxvdmUgdG8NCj4gYmUgYWJsZSB0byBoYXZlIGdlbmVyaWMgQ01BIERU
IGdsdWUgZm9yIG5vbiBETUEgQVBJIGRyaXZlciBhbGxvY2F0aW9ucywgYXMNCj4gdGhlcmUgb2J2
aW91c2x5IGlzIGEgbmVlZCBmb3IgaXQuICBTbyBiYXNpY2FsbHkgdGhlIHNhbWUgYXMgYWJvdmUs
IGp1c3QgYWRkZWQNCj4gdG8ga2VybmVsL2NtYS5jIGFzIGEgZ2VuZXJpYyBBUEkuDQoNClRoYW5r
cyBmb3IgdGhlIGhpbnRzLiBJJ2xsIHRyeSB0byBhZGQgdGhhdC4NCg0KVGhhbmtzLA0KUGVuZy4N
Cg0KDQo=
