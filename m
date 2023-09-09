Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD41FEEB57F
	for <linux-remoteproc@archiver.kernel.org>; Sat,  9 Sep 2023 06:28:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240020AbjIIG24 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 9 Sep 2023 02:28:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233815AbjIIG2x (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 9 Sep 2023 02:28:53 -0400
Received: from klingt.org (mail.klingt.org [86.59.21.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FFA1BC5
        for <linux-remoteproc@vger.kernel.org>; Fri,  8 Sep 2023 23:28:47 -0700 (PDT)
Received: from [10.1.176.1] (50.8.dsl3.ip.foni.net [62.214.8.50])
        (authenticated bits=0)
        by klingt.org (8.17.2/8.17.2/Debian-1) with ESMTPSA id 3896SbFG2241352
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Sat, 9 Sep 2023 08:28:40 +0200
Message-ID: <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
Date:   Sat, 9 Sep 2023 14:28:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Tim Blechmann <tim.blechmann@gmail.com>,
        linux-remoteproc@vger.kernel.org
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
Content-Language: en-US
From:   Tim Blechmann <tim@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
In-Reply-To: <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zEBmXND7xyN0s0tyuQVhsJFI"
X-Greylist: inspected by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Sat, 09 Sep 2023 08:28:41 +0200 (CEST) for IP:'62.214.8.50' DOMAIN:'50.8.dsl3.ip.foni.net' HELO:'[10.1.176.1]' FROM:'tim@klingt.org' RCPT:''
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Sat, 09 Sep 2023 08:28:41 +0200 (CEST)
X-Virus-Scanned: clamav-milter 1.0.2 at es.klingt.org
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zEBmXND7xyN0s0tyuQVhsJFI
Content-Type: multipart/mixed; boundary="------------HderXdPW3p7fLErwusPGTALP";
 protected-headers="v1"
From: Tim Blechmann <tim@klingt.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Tim Blechmann <tim.blechmann@gmail.com>, linux-remoteproc@vger.kernel.org
Message-ID: <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
In-Reply-To: <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>

--------------HderXdPW3p7fLErwusPGTALP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

Pj4+Pj4gd2hlbiB3ZSBjYW5ub3QgZ2V0IGEgdHggYnVmZmVyIChgZ2V0X2FfdHhfYnVmYCkg
YHJwbXNnX3VwcmVmX3NsZWVwZXJzYA0KPj4+Pj4gZW5hYmxlcyB0eC1jb21wbGV0ZSBpbnRl
cnJ1cHQuDQo+Pj4+PiBob3dldmVyIGlmIHRoZSBpbnRlcnJ1cHQgaXMgZXhlY3V0ZWQgYWZ0
ZXIgYGdldF9hX3R4X2J1ZmAgYW5kIGJlZm9yZQ0KPj4+Pj4gYHJwbXNnX3VwcmVmX3NsZWVw
ZXJzYCB3ZSBtYXkgbWlzIHRoZSB0eC1jb21wbGV0ZSBpbnRlcnJ1cHQgYW5kIHNsZWVwDQo+
Pj4+PiBmb3IgdGhlIGZ1bGwgMTUgc2Vjb25kcy4NCj4+Pj4NCj4+Pj4NCj4+Pj4gSXMgdGhl
cmUgYW55IHJlYXNvbiB3aHkgeW91ciBjby1wcm9jZXNzb3IgaXMgdW5hYmxlIHRvIHJlbGVh
c2UgdGhlIFRYIFJQTVNHDQo+Pj4+IGJ1ZmZlcnMgZm9yIDE1IHNlY29uZHM/IElmIG5vdCwg
eW91IHNob3VsZCBmaXJzdCBkZXRlcm1pbmUgdGhlIHJlYXNvbiB3aHkgaXQgaXMNCj4+Pj4g
c3RhbGxlZC4NCj4+Pg0KPj4+IEFybmF1ZCdzIGNvbmNlcm4gaXMgdmFsaWQuwqAgSWYgdGhl
IHJlbW90ZSBwcm9jZXNzb3IgY2FuJ3QgY29uc3VtZSBhIGJ1ZmZlcg0KPj4+IHdpdGhpbiAx
NSBzZWNvbmRzLCBzb21ldGhpbmcgaXMgcHJvYmFibHkgd3JvbmcuDQo+Pj4NCj4+PiBUaGF0
IHNhaWQsIEkgYmVsaWV2ZSB5b3VyIGFzc2VzbWVudCBvZiB0aGUgc2l0dWF0aW9uIGlzIGNv
cnJlY3QuwqAgKklmKiB0aGUgVFgNCj4+PiBjYWxsYmFjayBpcyBkaXNhYmxlZCBhbmQgdGhl
cmUgaXMgbm8gYnVmZmVyIGF2YWlsYWJsZSwgdGhlcmUgaXMgYSB3aW5kb3cgb2YNCj4+PiBv
cHBvcnR1bml0eSBiZXR3ZWVuIGNhbGxzIHRvIGdldF9hX3R4X2J1ZigpIGFuZCBycG1zZ191
cHJlZl9zbGVlcGVycygpIGZvciBhbg0KPj4+IGludGVycnVwdCB0byBhcnJpdmUgaW4gZnVu
Y3Rpb24gcnBtc2dfc2VuZF9vZmZjaGFubmVsX3JhdygpLg0KPj4NCj4+IHRoZSByZW1vdGUg
cHJvY2Vzc29yIGNlcnRhaW5seSByZWxlYXNlcyB0aGUgdHggYnVmZmVyIGFuZCBhY2NvcmRp
bmcgdG8gbXkNCj4+IHRyYWNpbmcgdGhlIGB2cmluZ19pbnRlcnJ1cHRgIGZpcmVzIGltbWVk
aWF0ZWx5IGJlZm9yZSBgcnBtc2dfc2VuZGAgZW50ZXJzIHRoZQ0KPj4gYHJwbXNnX3VwcmVm
X3NsZWVwZXJzYC4NCj4gDQo+IA0KPiBJZiBJIHdlbGwgdW5kZXJzdG9vZCB5b3VyIHBvaW50
LCB0aGUgaXNzdWUgb2NjdXIgaW4gZm9sbG93aW5nIHJhY2UgY29uZGl0aW9uDQo+IA0KPiAt
IGFsbCB0aGUgVHggYnVmZmVycyBhcmUgdXNlZA0KPiAtIGluIHJwbXNnX3NlbmRfb2ZmY2hh
bm5lbF9yYXcoKSBmdW5jdGlvbiwgd2UgdHJ5IHRvIGdldCBhIGJ1ZmZlciB1c2luZw0KPiBn
ZXRfYV90eF9idWYodnJwKSB0aGF0IHJldHVybnMgTlVMTA0KPiAtIHJwbXNnX3htaXRfZG9u
ZSBpcyBjYWxsZWQgYXMgYSBUeCBidWZmZXIgaXMgcmVsZWFzZWQgYnkgdGhlIHJlbW90ZSBw
cm9jZXNzb3INCj4gICAgYW5kIG5vdyBmcmVlDQo+IC0gaW4gcnBtc2dfc2VuZF9vZmZjaGFu
bmVsX3JhdygpIHJwbXNnX3VwcmVmX3NsZWVwZXJzIGlzIGNhbGxlZA0KPiANCj4gQXQgdGhp
cyBwb2ludCB5b3UgYXJlIG5vdGhpbmcgaGFwcGVuIHVudGlsIDE1IHNlY29uZCBiZWNhdXNl
IHJwbXNnX3htaXRfZG9uZSBpcw0KPiBuZXZlciBjYWxsZWQgIGFnYWluIHRoYXQgd291bGQg
d2FrZSB1cCB0aGUgd2FpdHF1ZXVlIHRvIGNhbGwgZ2V0X2FfdHhfYnVmKCkNCg0KeWVzLCB0
aGlzIGlzIHRoZSBiZWhhdmlvdXIgdGhhdCBpJ3ZlIGJlZW4gc2VlaW5nOg0KDQp2aXJ0aW8g
ZW1pdHMgYSBmZXcgdGltZXM6DQpbICA0MDQuWFhYWFhYXSBObyBtb3JlIGJ1ZmZlcnMgaW4g
cXVldWUNCmFuZCB0aGVuDQpbICA0MDQuNTg4NzIyXSByZW1vdGVwcm9jIHJlbW90ZXByb2Mw
OiB2cSBpbmRleCAxIGlzIGludGVycnVwdGVkDQpbICA0MDQuNTk3MjQ5XSB2aXJ0cXVldWUg
aW50ZXJydXB0IHdpdGggbm8gd29yayBmb3IgNmQ1M2YxM2ENCg0KPiBJZiB5ZXMgd2hhdCBp
cyBub3QgY2xlYXIgdG8gbWUgaXMgdGhhdCB3YWl0X2V2ZW50X2ludGVycnVwdGlibGVfdGlt
ZW91dCgpIHNlZW1zDQo+IHRvIHRlc3QgdGhlIGNvbmRpdGlvbiAoc28gY2FsbCBnZXRfYV90
eF9idWYoKSkgYmVmb3JlIGVudGVyaW5nIGluIHNsZWVwWzFdLiBBDQo+IGZyZWUgVFggYnVm
ZmVyIHNob3VsZCBiZSBmb3VuZCBhdCB0aGlzIHN0ZXAuDQo+IA0KPiBbMV1odHRwczovL2Vs
aXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2luY2x1ZGUvbGludXgvd2Fp
dC5oI0w1MzQNCg0KaG1tLCBpbnRlcmVzdGluZy4gYnV0IHRoYXQgd291bGQgaW1wbHkgYSB0
aW1pbmcgaXNzdWUgd2hlcmUgY2FsbGluZyANCmdldF9hX3R4X2J1ZiB0d2ljZSBzb21laG93
IG1ha2VzIGEgZGlmZmVyZW5jZSBhcyBvcHBvc2VkIHRvIGNhbGxpbmcgaXQgDQpvbmx5IG9u
Y2UuDQoNCndvdWxkIHRoZSAiaW50ZXJydXB0IHdpdGggbm8gd29yayIgcG9pbnQgdG8gYSBk
aWZmZXJlbnQgY2F1c2UgZm9yIHRoZSANCmlzc3VlIHRoYXQgd2UgYXJlIHNlZWluZz8NCg0K
PiANCj4gUmVnYXJkcywNCj4gQXJuYXVkDQo+IA0KPj4NCj4+IGFmdGVyIGFwcGx5aW5nIHRo
aXMgcGF0Y2ggd2UgaGF2ZW4ndCBiZWVuIGFibGUgdG8gcmVwcm9kdWNlIHRoZSAxNXMgdGlt
ZW91dA0KPj4gYW55bW9yZSwgd2hlcmVhcyBiZWZvcmUgd2UgY291bGQgZWFzaWx5IHJlcHJv
ZHVjZSBpdCB3aXRoIGNlcnRhaW4gd29ya2xvYWRzLg0KPj4NCj4+PiAzKSBUaGlzIHBhdGNo
IGdldHMgYXBwbGllZCB3aGVuIHJjMSBjb21lcyBvdXQgc28gdGhhdCBpdCBoYXMgNiBvciA3
IHdlZWtzIHRvDQo+Pj4gc29hay7CoCBObyBlcnJvciBhcmUgbG9ja3MgYXJlIHJlcG9ydGVk
IGR1ZSB0byB0aGlzIHBhdGNoIGR1cmluZyB0aGF0IHRpbWUuDQo+Pg0KPj4gbWVudGlvbmlu
ZyBsb2NrczogaSB3YXMgYSBiaXQgdW5jZXJ0YWluIGFib3V0IGEgZ29vZCB3YXkgdG8gaW1w
bGVtZW50IHRoZSByZXRyeSwNCj4+IHNpbmNlIGJvdGggYHJwbXNnX3VwcmVmX3NsZWVwZXJz
YCBhbmQgYGdldF9hX3R4X2J1ZmAgYm90aCBhY3F1aXJlIHRoZSBzYW1lDQo+PiBtdXRleC4g
aSBicmllZmx5IGNvbnNpZGVyZWQgdG8gYWRkIGBnZXRfYV90eF9idWZgIGludG8gYHJwbXNn
X3VwcmVmX3NsZWVwZXJzYCB0bw0KPj4gYXZvaWQgbG9ja2luZyB0aGUgc2FtZSBtdXRleCBt
dWx0aXBsZSB0aW1lcywgdGhvdWdoIGl0IGFkZHMgYSBiaXQgb2YgY29tcGxleGl0eQ0KPj4g
dG8gdGhlIGltcGxlbWVudGF0aW9uIGFuZCBoYXJtcyByZWFkYWJpbGl0eSBhIGJpdC4NCj4+
IGFyZSB0aGVyZSBhbnkgcmVjb21tZW5kYXRpb25zIG9uIHRoaXMgdG9waWMgb3IgYXJlIChs
aWtlbHkgbm9uLWNvbnRlbmRlZCkgbG9ja3MNCj4+IG5vdCBleHBlbnNpdmUgZW5vdWdoIHRv
IGp1c3RpZnkgdGhlIGFkZGVkIGNvbXBsZXhpdHk/DQo+Pg0KPj4gdGhhbmtzLA0KPj4gdGlt
DQo+Pg0KPj4NCj4+Pg0KPj4+Pg0KPj4+PiBSZWdhcmRzLA0KPj4+PiBBcm5hdWQNCj4+Pj4N
Cj4+Pj4+DQo+Pj4+PiBpbiB0aGlzIGNhc2UsIHNvIHdlIHJlLXRyeSBvbmNlIGJlZm9yZSB3
ZSByZWFsbHkgc3RhcnQgdG8gc2xlZXANCj4+Pj4+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBU
aW0gQmxlY2htYW5uIDx0aW1Aa2xpbmd0Lm9yZz4NCj4+Pj4+IC0tLQ0KPj4+Pj4gIMKgIGRy
aXZlcnMvcnBtc2cvdmlydGlvX3JwbXNnX2J1cy5jIHwgMjQgKysrKysrKysrKysrKysrLS0t
LS0tLS0tDQo+Pj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pDQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcnBtc2cv
dmlydGlvX3JwbXNnX2J1cy5jDQo+Pj4+PiBiL2RyaXZlcnMvcnBtc2cvdmlydGlvX3JwbXNn
X2J1cy5jDQo+Pj4+PiBpbmRleCA5MDVhYzc5MTBjOTguLjJhOWQ0MjIyNWU2MCAxMDA2NDQN
Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvcnBtc2cvdmlydGlvX3JwbXNnX2J1cy5jDQo+Pj4+PiAr
KysgYi9kcml2ZXJzL3JwbXNnL3ZpcnRpb19ycG1zZ19idXMuYw0KPj4+Pj4gQEAgLTU4Nywy
MSArNTg3LDI3IEBAIHN0YXRpYyBpbnQgcnBtc2dfc2VuZF9vZmZjaGFubmVsX3JhdyhzdHJ1
Y3QNCj4+Pj4+IHJwbXNnX2RldmljZSAqcnBkZXYsDQo+Pj4+PiAgwqAgwqDCoMKgwqDCoCAv
KiBubyBmcmVlIGJ1ZmZlciA/IHdhaXQgZm9yIG9uZSAoYnV0IGJhaWwgYWZ0ZXIgMTUgc2Vj
b25kcykgKi8NCj4+Pj4+ICDCoMKgwqDCoMKgIHdoaWxlICghbXNnKSB7DQo+Pj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgIC8qIGVuYWJsZSAidHgtY29tcGxldGUiIGludGVycnVwdHMsIGlm
IG5vdCBhbHJlYWR5IGVuYWJsZWQgKi8NCj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgcnBt
c2dfdXByZWZfc2xlZXBlcnModnJwKTsNCj4+Pj4+ICDCoCAtwqDCoMKgwqDCoMKgwqAgLyoN
Cj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgICogc2xlZXAgdW50aWwgYSBmcmVlIGJ1ZmZlciBp
cyBhdmFpbGFibGUgb3IgMTUgc2VjcyBlbGFwc2UuDQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDC
oCAqIHRoZSB0aW1lb3V0IHBlcmlvZCBpcyBub3QgY29uZmlndXJhYmxlIGJlY2F1c2UgdGhl
cmUncw0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgKiBsaXR0bGUgcG9pbnQgaW4gYXNraW5n
IGRyaXZlcnMgdG8gc3BlY2lmeSB0aGF0Lg0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqAgKiBp
ZiBsYXRlciB0aGlzIGhhcHBlbnMgdG8gYmUgcmVxdWlyZWQsIGl0J2QgYmUgZWFzeSB0byBh
ZGQuDQo+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IGVyciA9IHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZV90aW1lb3V0KHZycC0+c2VuZHEsDQo+
Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKG1zZyA9IGdl
dF9hX3R4X2J1Zih2cnApKSwNCj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBtc2Vjc190b19qaWZmaWVzKDE1MDAwKSk7DQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgLyogbWFrZSBzdXJlIHRvIHJldHJ5IHRvIGdyYWIgdHggYnVmZmVyIGJlZm9yZSB3
ZSBzdGFydCB3YWl0aW5nICovDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgbXNnID0gZ2V0X2Ff
dHhfYnVmKHZycCk7DQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1zZykgew0KPj4+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gMDsNCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCB9IGVsc2Ugew0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoNCj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBzbGVlcCB1bnRpbCBhIGZyZWUgYnVmZmVyIGlz
IGF2YWlsYWJsZSBvciAxNSBzZWNzIGVsYXBzZS4NCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgKiB0aGUgdGltZW91dCBwZXJpb2QgaXMgbm90IGNvbmZpZ3VyYWJsZSBiZWNh
dXNlIHRoZXJlJ3MNCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBsaXR0bGUg
cG9pbnQgaW4gYXNraW5nIGRyaXZlcnMgdG8gc3BlY2lmeSB0aGF0Lg0KPj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqIGlmIGxhdGVyIHRoaXMgaGFwcGVucyB0byBiZSByZXF1
aXJlZCwgaXQnZCBiZSBlYXN5IHRvIGFkZC4NCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgKi8NCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IHdhaXRfZXZl
bnRfaW50ZXJydXB0aWJsZV90aW1lb3V0KHZycC0+c2VuZHEsDQo+Pj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAobXNnID0gZ2V0X2FfdHhf
YnVmKHZycCkpLA0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgbXNlY3NfdG9famlmZmllcygxNTAwMCkpOw0KPj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIH0NCj4+Pj4+ICDCoCDCoMKgwqDCoMKgwqDCoMKgwqAgLyogZGlzYWJsZSAidHgt
Y29tcGxldGUiIGludGVycnVwdHMgaWYgd2UncmUgdGhlIGxhc3Qgc2xlZXBlciAqLw0KPj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBycG1zZ19kb3ducmVmX3NsZWVwZXJzKHZycCk7DQo+
Pj4+PiAgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHRpbWVvdXQgPyAqLw0KPj4+Pj4gIMKg
wqDCoMKgwqDCoMKgwqDCoCBpZiAoIWVycikgew0KPj4+DQo+Pg0KPiANCg==

--------------HderXdPW3p7fLErwusPGTALP--

--------------zEBmXND7xyN0s0tyuQVhsJFI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSu7kh//RBsHB5C9CwJrmcRco32gAUCZPwQlAUDAAAAAAAKCRAJrmcRco32gCGD
AQC+0k0uHfVMCsdaR14Badt1kouCYSHr1uOVAopFcT5zVQEA/vhS/qxgnKxczP/SuDUkSR59KoKU
DL8lrlytcjz3KA4=
=6NqV
-----END PGP SIGNATURE-----

--------------zEBmXND7xyN0s0tyuQVhsJFI--
