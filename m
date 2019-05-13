Return-Path: <fabien.dessenne@st.com>
From: Fabien DESSENNE <fabien.dessenne@st.com>
Subject: Re: [PATCH 0/2] hwspinlock: add the 'in_atomic' API
Date: Mon, 13 May 2019 09:10:34 +0000
Message-ID: <41036bca-1266-70e9-6485-b718c9741c3f@st.com>
References: <1551974303-24542-1-git-send-email-fabien.dessenne@st.com>
In-Reply-To: <1551974303-24542-1-git-send-email-fabien.dessenne@st.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC814E615EC016498780E18E25E92ACE@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Jonathan Corbet <corbet@lwn.net>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Benjamin GAIGNARD <benjamin.gaignard@st.com>, Alexandre TORGUE <alexandre.torgue@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>
List-ID: <linux-remoteproc@vger.kernel.org>

SGkNCg0KDQpHZW50bGUgcmVtaW5kZXINCg0KDQpGYWJpZW4NCg0KT24gMDcvMDMvMjAxOSA0OjU4
IFBNLCBGYWJpZW4gRGVzc2VubmUgd3JvdGU6DQo+IEluIGl0cyBjdXJyZW50IGltcGxlbWVudGF0
aW9uLCB0aGUgaHdzcGlubG9jayBmcmFtZXdvcmsgcmVsaWVzIG9uIGppZmZpZXMNCj4gdG8gaGFu
ZGxlIHRoZSB0aW1lb3V0IG9mIHRoZSBod3NwaW5fbG9ja190aW1lb3V0X3h4eCgpIEFQSS4NCj4g
SW4gYW4gYXRvbWljIGNvbnRleHQgKG9yIG1vcmUgcHJlY2lzZWx5IHdoZW4gaXJxIGFyZSBkaXNh
YmxlZCkgamlmZmllcyBkb2VzIG5vdA0KPiBpbmNyZWFzZSwgd2hpY2ggcHJldmVudHMgdGhlIHRp
bWVvdXQgdG8gcmVhY2ggaXRzIHRhcmdldCB2YWx1ZSAoaW5maW5pdGUgbG9vcCkuDQo+DQo+IE5v
dGUgdGhhdCB0aGVyZSBpcyBhbHJlYWR5IGFuIGh3c3BpbmxvY2sgdXNlciB0aGF0IHJ1bnMgaW4g
YXRvbWljIGNvbnRleHQNCj4gKGRyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzItZXh0aS5jKSBhbmQg
dGhhdCBoYXMgdG8gaGFuZGxlIGJ5IGl0c2VsZiB0aGUNCj4gdGltZW91dC4NCj4NCj4gVGhlIGZp
cnN0IHBhdGNoIG9mIHRoZSBzZXJpZXMgY29tcGxldGVzIHRoZSBEb2N1bWVudGF0aW9uICh0aGUg
J3JhdycgQVBJDQo+IGlzIG5vdCBkb2N1bWVudGVkKSwgYW5kIHRoZSBzZWNvbmQgcGF0Y2ggcHJv
dmlkZXMgd2l0aCB0aGUgJ2luX2F0b21pYycgQVBJLg0KPg0KPiBGYWJpZW4gRGVzc2VubmUgKDIp
Og0KPiAgICBod3NwaW5sb2NrOiBkb2N1bWVudCB0aGUgaHdzcGlubG9jayAncmF3JyBBUEkNCj4g
ICAgaHdzcGlubG9jazogYWRkIHRoZSAnaW5fYXRvbWljJyBBUEkNCj4NCj4gICBEb2N1bWVudGF0
aW9uL2h3c3BpbmxvY2sudHh0ICAgICAgICAgfCA4MSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysNCj4gICBkcml2ZXJzL2h3c3BpbmxvY2svaHdzcGlubG9ja19jb3JlLmMgfCA0
MyArKysrKysrKysrKysrLS0tLS0tDQo+ICAgaW5jbHVkZS9saW51eC9od3NwaW5sb2NrLmggICAg
ICAgICAgIHwgNjEgKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAgMyBmaWxlcyBjaGFu
Z2VkLCAxNjkgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pDQo+
