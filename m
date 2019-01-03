Return-Path: <benjamin.gaignard@st.com>
From: Benjamin GAIGNARD <benjamin.gaignard@st.com>
Subject: Re: [PATCH -next] hwspinlock: fix return value check in
 stm32_hwspinlock_probe()
Date: Thu, 3 Jan 2019 10:06:07 +0000
Message-ID: <16205f0c-3514-731c-e948-38695e3a525d@st.com>
References: <1546498950-105456-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1546498950-105456-1-git-send-email-weiyongjun1@huawei.com>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <B213CA72774C404EA4CE4C6288AC3697@st.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
To: Wei Yongjun <weiyongjun1@huawei.com>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre TORGUE <alexandre.torgue@st.com>
Cc: "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

DQpPbiAxLzMvMTkgODowMiBBTSwgV2VpIFlvbmdqdW4gd3JvdGU6DQo+IEluIGNhc2Ugb2YgZXJy
b3IsIHRoZSBmdW5jdGlvbiBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoKSByZXR1cm5zIEVSUl9QVFIo
KQ0KPiBhbmQgbmV2ZXIgcmV0dXJucyBOVUxMLiBUaGUgTlVMTCB0ZXN0IGluIHRoZSByZXR1cm4g
dmFsdWUgY2hlY2sgc2hvdWxkDQo+IGJlIHJlcGxhY2VkIHdpdGggSVNfRVJSKCkuDQo+DQo+IEZp
eGVzOiBmMjRmY2ZmMWQyNjcgKCJod3NwaW5sb2NrOiBhZGQgU1RNMzIgaHdzcGlubG9jayBkZXZp
Y2UiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBXZWkgWW9uZ2p1biA8d2VpeW9uZ2p1bjFAaHVhd2VpLmNv
bT4NCkFja2VkLWJ5OiBCZW5qYW1pbiBHYWlnbmFyZCA8YmVuamFtaW4uZ2FpZ25hcmRAZ21haWwu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2h3c3BpbmxvY2svc3RtMzJfaHdzcGlubG9jay5jIHwg
NCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaHdzcGlubG9jay9zdG0zMl9od3NwaW5sb2Nr
LmMgYi9kcml2ZXJzL2h3c3BpbmxvY2svc3RtMzJfaHdzcGlubG9jay5jDQo+IGluZGV4IDM0YThl
MDAuLjQ0MTgzOTIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaHdzcGlubG9jay9zdG0zMl9od3Nw
aW5sb2NrLmMNCj4gKysrIGIvZHJpdmVycy9od3NwaW5sb2NrL3N0bTMyX2h3c3BpbmxvY2suYw0K
PiBAQCAtNTcsOCArNTcsOCBAQCBzdGF0aWMgaW50IHN0bTMyX2h3c3BpbmxvY2tfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gICANCj4gICAJcmVzID0gcGxhdGZvcm1fZ2V0
X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4gICAJaW9fYmFzZSA9IGRldm1f
aW9yZW1hcF9yZXNvdXJjZSgmcGRldi0+ZGV2LCByZXMpOw0KPiAtCWlmICghaW9fYmFzZSkNCj4g
LQkJcmV0dXJuIC1FTk9NRU07DQo+ICsJaWYgKElTX0VSUihpb19iYXNlKSkNCj4gKwkJcmV0dXJu
IFBUUl9FUlIoaW9fYmFzZSk7DQo+ICAgDQo+ICAgCWFycmF5X3NpemUgPSBTVE0zMl9NVVRFWF9O
VU1fTE9DS1MgKiBzaXplb2Yoc3RydWN0IGh3c3BpbmxvY2spOw0KPiAgIAlodyA9IGRldm1fa3ph
bGxvYygmcGRldi0+ZGV2LCBzaXplb2YoKmh3KSArIGFycmF5X3NpemUsIEdGUF9LRVJORUwpOw0K
Pg0KPg0KPg==
