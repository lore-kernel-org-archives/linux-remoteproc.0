Return-Path: <fugang.duan@nxp.com>
From: Andy Duan <fugang.duan@nxp.com>
Subject: RE: [rpmsg PATCH v2 1/1] rpmsg: virtio_rpmsg_bus: fix unexpected huge
 vmap mappings
Date: Fri, 11 Jan 2019 01:28:46 +0000
Message-ID: 
 <VI1PR0402MB3600E7160A2921A8D3DCA055FF850@VI1PR0402MB3600.eurprd04.prod.outlook.com>
References: <1545812449-32455-1-git-send-email-fugang.duan@nxp.com>
 <CAKv+Gu-zfTZAZfiQt1iUn9otqeDkJP-y-siuBUrWUR-Kq=BsVQ@mail.gmail.com>
 <20181226145048.GA24307@infradead.org>
 <VI1PR0402MB3600AC833D6F29ECC34C8D4CFFB60@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <20181227121901.GA20892@infradead.org>
 <VI1PR0402MB3600799A06B6BFE5EBF8837FFFB70@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <VI1PR0402MB36000BD05AF4B242E13D9D05FF840@VI1PR0402MB3600.eurprd04.prod.outlook.com>
 <20190110140726.GA6223@infradead.org>
In-Reply-To: <20190110140726.GA6223@infradead.org>
Content-Language: en-US
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Christoph Hellwig <hch@infradead.org>
Cc: "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>, "ohad@wizery.com" <ohad@wizery.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, Linux-MM <linux-mm@kvack.org>, Robin Murphy <robin.murphy@arm.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "anup@brainfault.org" <anup@brainfault.org>, "loic.pallardy@st.com" <loic.pallardy@st.com>, dl-linux-imx <linux-imx@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>, Peng Fan <peng.fan@nxp.com>
List-ID: <linux-remoteproc@vger.kernel.org>

RnJvbTogQ2hyaXN0b3BoIEhlbGx3aWcgPG1haWx0bzpoY2hAaW5mcmFkZWFkLm9yZz4gU2VudDog
MjAxOcTqMdTCMTDI1SAyMjowNw0KPiBPbiBUaHUsIEphbiAxMCwgMjAxOSBhdCAwMTo0NToyMEFN
ICswMDAwLCBBbmR5IER1YW4gd3JvdGU6DQo+ID4gRG8geW91IGhhdmUgYW55IG90aGVyIGNvbW1l
bnRzIGZvciB0aGUgcGF0Y2ggPw0KPiA+IEN1cnJlbnQgZHJpdmVyIGJyZWFrIHJlbW90ZXByb2Mg
b24gTlhQIGkuTVg4IHBsYXRmb3JtICwgdGhlIHBhdGNoIGlzIGJ1Z2ZpeA0KPiB0aGUgdmlydGlv
IHJwbXNnIGJ1cywgd2UgaG9wZSB0aGUgcGF0Y2ggZW50ZXIgdG8gbmV4dCBhbmQgc3RhYmxlIHRy
ZWUgaWYgbm8NCj4gb3RoZXIgY29tbWVudHMuDQo+IA0KPiBUaGUgYW5zd2VyIHJlbWFpbnMgdGhh
dCB5b3UgQ0FOIE5PVCBjYWxsIHZtYWxsb2NfdG9fcGFnZSBvciB2aXJ0X3RvX3BhZ2UNCj4gb24g
RE1BIGNvaGVyZW50IG1lbW9yeSwgYW5kIHRoZSBkcml2ZXIgaGFzIGJlZW4gYnJva2VuIGV2ZXIg
c2luY2UgaXQgd2FzDQo+IG1lcmdlZC4gIFdlIG5lZWQgdG8gZml4IHRoZSByb290IGNhdXNlIGFu
ZCBub3QgdGhlIHN5bXB0b20uDQoNCkFzIE5YUCBpLk1YOCBwbGF0Zm9ybSByZXF1aXJlbWVudCB0
aGF0IE00IG9ubHkgYWNjZXNzIHRoZSBmaXhlZCBtZW1vcnkgcmVnaW9uLCBzbyBkbw0KWW91IGhh
dmUgYW55IHN1Z2dlc3Rpb24gdG8gZml4IHRoZSBpc3N1ZSBhbmQgc2F0aXNmeSB0aGUgcmVxdWly
ZW1lbnQgPyBPciBkbyB5b3UgaGF2ZSBwbGFuDQpUbyBmaXggdGhlIHJvb3QgY2F1c2UgPw0KDQpU
aGFua3MuDQo=
