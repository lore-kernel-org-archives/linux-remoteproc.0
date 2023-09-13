Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4ACCA550A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 08:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235107AbjIMIrh (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 04:47:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239045AbjIMIre (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 04:47:34 -0400
Received: from klingt.org (mail.klingt.org [86.59.21.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2C161996
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 01:47:29 -0700 (PDT)
Received: from [10.1.176.2] (50.8.dsl3.ip.foni.net [62.214.8.50])
        (authenticated bits=0)
        by klingt.org (8.17.2/8.17.2/Debian-1) with ESMTPSA id 38D8lKpF3830750
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 13 Sep 2023 10:47:22 +0200
Message-ID: <117fbe3c-3db4-4f82-1d96-11501259e209@klingt.org>
Date:   Wed, 13 Sep 2023 16:47:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To:     Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Tim Blechmann <tim.blechmann@gmail.com>,
        linux-remoteproc@vger.kernel.org,
        agostino.carballeira@native-instruments.de
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
 <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
 <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>
 <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>
 <d2a303ad-4dcf-de52-38db-53695169fe33@klingt.org>
 <d37a0431-9b4d-1215-2c2c-14c8963f93a7@foss.st.com>
From:   Tim Blechmann <tim@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
In-Reply-To: <d37a0431-9b4d-1215-2c2c-14c8963f93a7@foss.st.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3fm1LWsLSUVTDtSUGBUd0lHT"
X-Greylist: inspected by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Wed, 13 Sep 2023 10:47:23 +0200 (CEST) for IP:'62.214.8.50' DOMAIN:'50.8.dsl3.ip.foni.net' HELO:'[10.1.176.2]' FROM:'tim@klingt.org' RCPT:''
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Wed, 13 Sep 2023 10:47:23 +0200 (CEST)
X-Virus-Scanned: clamav-milter 1.0.3 at es.klingt.org
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3fm1LWsLSUVTDtSUGBUd0lHT
Content-Type: multipart/mixed; boundary="------------0WLVAIE0vhIQXmurk3W0Ye5Y";
 protected-headers="v1"
From: Tim Blechmann <tim@klingt.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Tim Blechmann <tim.blechmann@gmail.com>,
 linux-remoteproc@vger.kernel.org, agostino.carballeira@native-instruments.de
Message-ID: <117fbe3c-3db4-4f82-1d96-11501259e209@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
 <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
 <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>
 <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>
 <d2a303ad-4dcf-de52-38db-53695169fe33@klingt.org>
 <d37a0431-9b4d-1215-2c2c-14c8963f93a7@foss.st.com>
In-Reply-To: <d37a0431-9b4d-1215-2c2c-14c8963f93a7@foss.st.com>

--------------0WLVAIE0vhIQXmurk3W0Ye5Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

bWFueSB0aGFua3MgZm9yIHlvdXIgYW5hbHlzaXMsIHZlcnkgaW50ZXJlc3RpbmcuDQoNCj4g
cGxlYXNlIGZpbmQgYmVsb3cgYW4gZXh0cmFjdCBvZiB5b3VyIHRyYWNlIHdpdGggbXkgYW5h
bHlzaXM6DQo+IA0KPiANCj4gICBzdG0zMm1wMV9idWxrX3AtMzkwICAgICBbMDAxXSAuLi4u
LiAgIDkwNy4yNDEyMjY6IHJwbXNnX3NlbmQNCj4gPC1ycG1zZ19pbnRlcmNvcmVfc2VuZF9i
dWZmZXIuY29uc3Rwcm9wLjANCj4gICBzdG0zMm1wMV9idWxrX3AtMzkwICAgICBbMDAxXSAu
Li4uLiAgIDkwNy4yNDEyMjg6IHZpcnRpb19ycG1zZ19zZW5kIDwtcnBtc2dfc2VuZA0KPiAg
IHN0bTMybXAxX2J1bGtfcC0zOTAgICAgIFswMDFdIC4uLi4uICAgOTA3LjI0MTIzNzogdmly
dHF1ZXVlX2VuYWJsZV9jYg0KPiA8LXJwbXNnX3NlbmRfb2ZmY2hhbm5lbF9yYXcNCj4gICBz
dG0zMm1wMV9idWxrX3AtMzkwICAgICBbMDAxXSAuLi4uLiAgIDkwNy4yNDEyMzk6IHZpcnRx
dWV1ZV9lbmFibGVfY2JfcHJlcGFyZQ0KPiANCj4gQXQgdGhpcyBwb2ludCBzZWVtcyB0aGF0
IG5vIG1vcmUgVFgtYnVmZmVyDQo+IA0KPiA8LXJwbXNnX3JlY3Zfc2luZ2xlDQo+ICAgICAg
IGt3b3JrZXIvMDo0LTY3ICAgICAgWzAwMF0gLi4uLi4gICA5MDcuMjQyNTMzOiB2cmluZ19p
bnRlcnJ1cHQNCj4gPC1ycHJvY192cV9pbnRlcnJ1cHQNCj4gICAgICAga3dvcmtlci8wOjQt
NjcgICAgICBbMDAwXSAuLi4uLiAgIDkwNy4yNDI1MzY6IHJwbXNnX3htaXRfZG9uZQ0KPiAN
Cj4gSGVyZSB5b3UgcmVjZWl2ZSAgYW4gaW50ZXJydXB0IGluZGljYXRpbmcgdGhhdCBUWCBi
dWZmZXIgaGFzIGJlZW4gcmVsZWFzZWQgYnkNCj4gdGhlIHJlbW90ZS4gdGhhdCdzIHRoZSBl
eHBlY3RlZCBiZWhhdmlvci4NCj4gDQo+IA0KPiA8LXJwbXNnX3NlbmRfb2ZmY2hhbm5lbF9y
YXcNCj4gICBzdG0zMm1wMV9idWxrX3AtMzkwICAgICBbMDAwXSAuLi4uLiAgIDk4NC4wNTQ5
NDE6IHJwbXNnX3NlbmQNCj4gPC1ycG1zZ19pbnRlcmNvcmVfc2VuZF9idWZmZXIuY29uc3Rw
cm9wLjANCj4gICBzdG0zMm1wMV9idWxrX3AtMzkwICAgICBbMDAwXSAuLi4uLiAgIDk4NC4w
NTQ5NDM6IHZpcnRpb19ycG1zZ19zZW5kIDwtcnBtc2dfc2VuZA0KPiAgIHN0bTMybXAxX2J1
bGtfcC0zOTAgICAgIFswMDBdIC4uLi4uICAgOTg0LjA1NDk1NjogdmlydHF1ZXVlX2VuYWJs
ZV9jYg0KPiA8LXJwbXNnX3NlbmRfb2ZmY2hhbm5lbF9yYXcNCj4gICBzdG0zMm1wMV9idWxr
X3AtMzkwICAgICBbMDAwXSAuLi4uLiAgIDk4NC4wNTQ5NTg6IHZpcnRxdWV1ZV9lbmFibGVf
Y2JfcHJlcGFyZQ0KPiA8LXZpcnRxdWV1ZV9lbmFibGVfY2INCj4gICBzdG0zMm1wMV9idWxr
X3AtMzkwICAgICBbMDAwXSAuLi4uLiAgIDk5OS4zOTg2Njc6IHZpcnRxdWV1ZV9kaXNhYmxl
X2NiDQo+IDwtcnBtc2dfc2VuZF9vZmZjaGFubmVsX3Jhdw0KPiAgIHN0bTMybXAxX2J1bGtf
cC0zOTAgICAgIFswMDBdIC4uLi4uICAgOTk5LjQxNDg0MDogcnBtc2dfc2VuZA0KPiA8LXJw
bXNnX2ludGVyY29yZV9zZW5kX2J1ZmZlci5jb25zdHByb3AuMA0KPiAgIHN0bTMybXAxX2J1
bGtfcC0zOTAgICAgIFswMDBdIC4uLi4uICAgOTk5LjQxNDg0MzogdmlydGlvX3JwbXNnX3Nl
bmQgPC1ycG1zZ19zZW5kDQo+ICAgc3RtMzJtcDFfYnVsa19wLTM5MCAgICAgWzAwMF0gLi4u
Li4gICA5OTkuNDE0ODU1OiB2aXJ0cXVldWVfZW5hYmxlX2NiDQo+IDwtcnBtc2dfc2VuZF9v
ZmZjaGFubmVsX3Jhdw0KPiAgIHN0bTMybXAxX2J1bGtfcC0zOTAgICAgIFswMDBdIC4uLi4u
ICAgOTk5LjQxNDg1NzogdmlydHF1ZXVlX2VuYWJsZV9jYl9wcmVwYXJlDQo+IA0KPiBIZXJl
IHlvdSBoYXZlIGFnYWluIG5vIG1vcmUgVFggYnVmZmVyLiBGcm9tIHRoaXMgcG9pbnQgdGhl
cmUgaXMgbm8gbW9yZSBhY3Rpdml0eQ0KPiBuZWl0aGVyIGluIFRYIG5vciBpbiBSWCB1bnRp
bCB0aGUgdGltZW91dCBvZiAxNSBzZWNvbmRzLg0KPiBJZiB5b3UgaGF2ZSBhIGxvb2sgdG8g
cnByb2NfdnFfaW50ZXJydXB0IHRoZSBsYXN0IG9uZSBvY2N1cnMgYXQgOTA3LjI0MjUzMw0K
PiANCj4gDQo+IEFzIHlvdSBoYXZlIG5vIG1vcmUgdmlydHF1ZXVlIGludGVycnVwdHMgY2Fs
bCBmb3IgYm90aCBkaXJlY3Rpb25zLCB0aGUgaXNzdWUgaXMNCj4gcHJvYmFibHkgZWl0aGVy
IGluIHRoZSBDb3J0ZXgtTSBmaXJtd2FyZSwgd2hpY2ggc2VlbXMgdG8gYmUgc3RhbGxlZCwg
b3IgZHVlIHRvIGENCj4gZGlzYWJsZSBvZiB0aGUgSVJRcyBpbiBMaW51eC4NCg0KYWZhaWN0
IHdlIGNhbiBydWxlIG91dCBhIGNvbXBsZXRlIHN0YWxsIG9mIHRoZSBjb3J0ZXgtbSBmaXJt
d2FyZTogaWYgd2UgDQpjaGFuZ2UgdGhlIHJwbXNnX3NlbmQgdG8gYSBycG1zZ190cnlzZW5k
L21zbGVlcCBsb29wLCB0aGUgdHJ5c2VuZCB3aWxsIA0Kc3VjY2VlZCB0byBnZXQgYSBidWZm
ZXIgYWZ0ZXIgYSBmZXcgaXRlcmF0aW9ucy4NCg0KPiBvciBkdWUgdG8gYSBkaXNhYmxlIG9m
IHRoZSBJUlFzIGluIExpbnV4Lg0KDQpkbyB5b3UgaGF2ZSBzb21lIHJlY29tbWVuZGF0aW9u
cyBob3cgd2UgY291bGQgdHJhY2UgdGhpcz8NCg0KbWFueSB0aGFua3MsDQp0aW0NCg0KPiA8
LXZpcnRxdWV1ZV9lbmFibGVfY2INCj4gICBzdG0zMm1wMV9idWxrX3AtMzkwICAgICBbMDAw
XSAuLi4uLiAgMTAxNC43NTg2Nzg6IHZpcnRxdWV1ZV9kaXNhYmxlX2NiDQo+IDwtcnBtc2df
c2VuZF9vZmZjaGFubmVsX3Jhdw0KPiAgIHN0bTMybXAxX2J1bGtfcC0zOTAgICAgIFswMDBd
IC4uLi4uICAxMDE0Ljc3NDgwMjogcnBtc2dfc2VuZA0KPiA8LXJwbXNnX2ludGVyY29yZV9z
ZW5kX2J1ZmZlci5jb25zdHByb3AuMA0KPiAgIHN0bTMybXAxX2J1bGtfcC0zOTAgICAgIFsw
MDBdIC4uLi4uICAxMDE0Ljc3NDgwNDogdmlydGlvX3JwbXNnX3NlbmQgPC1ycG1zZ19zZW5k
DQo+ICAgc3RtMzJtcDFfYnVsa19wLTM5MCAgICAgWzAwMF0gLi4uLi4gIDEwMTQuNzc0ODE1
OiB2aXJ0cXVldWVfZW5hYmxlX2NiDQoNCg0K

--------------0WLVAIE0vhIQXmurk3W0Ye5Y--

--------------3fm1LWsLSUVTDtSUGBUd0lHT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSu7kh//RBsHB5C9CwJrmcRco32gAUCZQF3FwUDAAAAAAAKCRAJrmcRco32gEQ6
AQDeYSvklK4dz84eydyAxFFsSIFpP5zqIS/Yecy1QF6yKQEAgTSykdbTkGfxWc1ZUk2t2uBqjhVH
YUTKKGw86aVEGQU=
=FpoY
-----END PGP SIGNATURE-----

--------------3fm1LWsLSUVTDtSUGBUd0lHT--
