Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 460E4EE3F39
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 01:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbjIMBHZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 21:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236598AbjIMBHY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 21:07:24 -0400
Received: from klingt.org (mail.klingt.org [86.59.21.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 848B310C9
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 18:07:19 -0700 (PDT)
Received: from [192.168.0.108] ([202.184.201.145])
        (authenticated bits=0)
        by klingt.org (8.17.2/8.17.2/Debian-1) with ESMTPSA id 38D177BQ3610666
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 13 Sep 2023 03:07:09 +0200
Message-ID: <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>
Date:   Wed, 13 Sep 2023 09:07:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
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
From:   Tim Blechmann <tim@klingt.org>
In-Reply-To: <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Yo8ecTa4HMDlMgl7jWtRtZXB"
X-Greylist: inspected by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Wed, 13 Sep 2023 03:07:10 +0200 (CEST) for IP:'202.184.201.145' DOMAIN:'[202.184.201.145]' HELO:'[192.168.0.108]' FROM:'tim@klingt.org' RCPT:''
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Wed, 13 Sep 2023 03:07:10 +0200 (CEST)
X-Virus-Scanned: clamav-milter 1.0.3 at es.klingt.org
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Yo8ecTa4HMDlMgl7jWtRtZXB
Content-Type: multipart/mixed; boundary="------------b84AGJOHtZtl09aotLowmD0U";
 protected-headers="v1"
From: Tim Blechmann <tim@klingt.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Tim Blechmann <tim.blechmann@gmail.com>,
 linux-remoteproc@vger.kernel.org, agostino.carballeira@native-instruments.de
Message-ID: <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
 <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
 <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>
In-Reply-To: <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>

--------------b84AGJOHtZtl09aotLowmD0U
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

Pj4gdmlydGlvIGVtaXRzIGEgZmV3IHRpbWVzOg0KPj4gW8KgIDQwNC5YWFhYWFhdIE5vIG1v
cmUgYnVmZmVycyBpbiBxdWV1ZQ0KPj4gYW5kIHRoZW4NCj4+IFvCoCA0MDQuNTg4NzIyXSBy
ZW1vdGVwcm9jIHJlbW90ZXByb2MwOiB2cSBpbmRleCAxIGlzIGludGVycnVwdGVkDQo+PiBb
wqAgNDA0LjU5NzI0OV0gdmlydHF1ZXVlIGludGVycnVwdCB3aXRoIG5vIHdvcmsgZm9yIDZk
NTNmMTNhDQo+IA0KPiBEaWZmaWN1bHQgdG8gdW5kZXJzdGFuZCB0aGUgc2NoZWR1bGluZyB3
aXRoIHlvdXIgdHJhY2UuIENvdWxkIHlvdSBlbmFibGUgZnRyYWNlIHRvDQo+IG9ic2VydmUg
aXQgKG1haWxib3ggaW50ZXJydXB0cyxycG1zZyBhbmQgdmlydGlvIGZ1bmN0aW9ucykNCg0K
ZG9lcyB0aGlzIGhlbHAgKGl0J3MgYSB0cmFjZSB0aGF0IGEgY293b3JrZXIgZGlkIGEgZmV3
IGRheXMgYWdvKT8NCg0KYGBgDQpyb290Oi4uLi9rZXJuZWwvdHJhY2luZyMgY2F0IHRyYWNl
IHwgaGVhZCAtNTANCiMgdHJhY2VyOiBmdW5jdGlvbl9ncmFwaA0KIw0KIyBDUFUgIERVUkFU
SU9OICAgICAgICAgICAgICAgICAgRlVOQ1RJT04gQ0FMTFMNCiMgfCAgICAgfCAgIHwgICAg
ICAgICAgICAgICAgICAgICB8ICAgfCAgIHwgICB8DQogIDApICsgMTAuMjUwIHVzICAgfCAg
ICAgICAgcnBtc2dfc2dfaW5pdCgpOw0KICAwKSArIDQyLjM3NSB1cyAgIHwgICAgICB9IC8q
IHJwbXNnX3NlbmRfb2ZmY2hhbm5lbF9yYXcgKi8NCiAgMCkgKyA1MS4xMjUgdXMgICB8ICAg
IH0gLyogdmlydGlvX3JwbXNnX3NlbmQgKi8NCiAgMCkgKyA1OS42MjUgdXMgICB8ICB9IC8q
IHJwbXNnX3NlbmQgKi8NCiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tDQogIDApICBzdG0zMm1wLTQxNCAgID0+ICBrd29ya2VyLTM2NQ0KICAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KICAwKSAgICAgICAgICAg
ICAgIHwgIHJwbXNnX3JlY3ZfZG9uZSgpIHsNCiAgMCkgICAgICAgICAgICAgICB8ICAgIHJw
bXNnX3JlY3Zfc2luZ2xlKCkgew0KICAwKSAgIDUuNTQyIHVzICAgIHwgICAgICBycG1zZ19z
Z19pbml0KCk7DQogIDApICsgMzYuNTQyIHVzICAgfCAgICB9DQogIDApICsgNDguMjUwIHVz
ICAgfCAgfQ0KICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
CiAgMCkgIGt3b3JrZXItMzY1ICAgPT4gIHN0bTMybXAtNDE0DQogIC0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQogIDApICAgNy4wMDAgdXMgICAgfCAg
cnBtc2dfZ2V0X2J1ZmZlcl9zaXplKCk7DQogIDApICAgICAgICAgICAgICAgfCAgcnBtc2df
c2VuZCgpIHsNCiAgMCkgICAgICAgICAgICAgICB8ICAgIHZpcnRpb19ycG1zZ19zZW5kKCkg
ew0KICAwKSAgICAgICAgICAgICAgIHwgICAgICBycG1zZ19zZW5kX29mZmNoYW5uZWxfcmF3
KCkgew0KICAwKSAgIDUuNjI1IHVzICAgIHwgICAgICAgIHJwbXNnX3NnX2luaXQoKTsNCiAg
MCkgKyAzNy4zMzMgdXMgICB8ICAgICAgfQ0KICAwKSArIDQ1LjkxNiB1cyAgIHwgICAgfQ0K
ICAwKSArIDU0LjI1MCB1cyAgIHwgIH0NCiAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tDQogIDApICBzdG0zMm1wLTQxNCAgID0+ICBrd29ya2VyLTM2NQ0K
ICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCg0KICAwKSAg
ICAgICAgICAgICAgIHwgIHJwbXNnX3JlY3ZfZG9uZSgpIHsNCiAgMCkgICAgICAgICAgICAg
ICB8ICAgIHJwbXNnX3JlY3Zfc2luZ2xlKCkgew0KICAwKSAgIDYuMDQxIHVzICAgIHwgICAg
ICBycG1zZ19zZ19pbml0KCk7DQogIDApICsgMzcuMjkyIHVzICAgfCAgICB9DQogIDApICsg
NDkuNTQyIHVzICAgfCAgfQ0KICAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0NCiAgMCkgIGt3b3JrZXItMzY1ICAgPT4gIHN0bTMybXAtNDE0DQogIC0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQogIDApICAgNi41MDAg
dXMgICAgfCAgcnBtc2dfZ2V0X2J1ZmZlcl9zaXplKCk7DQogIDApICAgICAgICAgICAgICAg
fCAgcnBtc2dfc2VuZCgpIHsNCiAgMCkgICAgICAgICAgICAgICB8ICAgIHZpcnRpb19ycG1z
Z19zZW5kKCkgew0KICAwKSAgICAgICAgICAgICAgIHwgICAgICBycG1zZ19zZW5kX29mZmNo
YW5uZWxfcmF3KCkgew0KICAwKSAgIDUuNDE3IHVzICAgIHwgICAgICAgIHJwbXNnX3NnX2lu
aXQoKTsNCiAgMCkgKyAzNi41ODMgdXMgICB8ICAgICAgfQ0KICAwKSArIDQ1LjE2NyB1cyAg
IHwgICAgfQ0KICAwKSArIDUzLjU4MyB1cyAgIHwgIH0NCmBgYA0KDQphcHBhcmVudGx5IHRo
aXMgaXMgd2hlcmUgaXQgZ2V0cyBzdHVjayAobm90IHN1cmUgaWYgaXQncyBlbm91Z2ggY29u
dGV4dCwgDQp0aG91Z2gpLg0KDQo+Pg0KPj4+IElmIHllcyB3aGF0IGlzIG5vdCBjbGVhciB0
byBtZSBpcyB0aGF0IHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZV90aW1lb3V0KCkgc2VlbXMN
Cj4+PiB0byB0ZXN0IHRoZSBjb25kaXRpb24gKHNvIGNhbGwgZ2V0X2FfdHhfYnVmKCkpIGJl
Zm9yZSBlbnRlcmluZyBpbiBzbGVlcFsxXS4gQQ0KPj4+IGZyZWUgVFggYnVmZmVyIHNob3Vs
ZCBiZSBmb3VuZCBhdCB0aGlzIHN0ZXAuDQo+Pj4NCj4+PiBbMV1odHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2luY2x1ZGUvbGludXgvd2FpdC5oI0w1
MzQNCj4+DQo+PiBobW0sIGludGVyZXN0aW5nLiBidXQgdGhhdCB3b3VsZCBpbXBseSBhIHRp
bWluZyBpc3N1ZSB3aGVyZSBjYWxsaW5nIGdldF9hX3R4X2J1Zg0KPj4gdHdpY2Ugc29tZWhv
dyBtYWtlcyBhIGRpZmZlcmVuY2UgYXMgb3Bwb3NlZCB0byBjYWxsaW5nIGl0IG9ubHkgb25j
ZS4NCj4+DQo+PiB3b3VsZCB0aGUgImludGVycnVwdCB3aXRoIG5vIHdvcmsiIHBvaW50IHRv
IGEgZGlmZmVyZW50IGNhdXNlIGZvciB0aGUgaXNzdWUgdGhhdA0KPj4gd2UgYXJlIHNlZWlu
Zz8NCj4gDQo+IExvb2sgbGlrZSB5b3UgaGF2ZSBub3QgcmVsZWFzZWQgdGhlIGJ1ZmZlciBv
biByZW1vdGUgc2lkZSBzbyBubyBidWZmZXIgaW4gdnJpbmcNCj4gdXNlZCBsaXN0Lg0KPiAN
Cj4gRG8geW91IHVzZSB0aGUgemVybyBjb3B5IChycG1zZ19ob2xkX3J4X2J1ZmZlcikgb24g
cmVtb3RlIHByb2Nlc3Nvcj8NCj4gSWYgeWVzLCBwbGVhc2UgY2hlY2sgdGhhdCB5b3UgaGF2
ZSBmb2xsb3dpbmcgZml4Og0KPiBodHRwczovL2dpdGh1Yi5jb20vT3BlbkFNUC9vcGVuLWFt
cC9jb21taXQvMmI2YTM4YTljNjg5MDg2OTk2MGVkNDFkNmExZGM5OTMwYzA3OWUwZA0KDQp5
ZXMsIHdlIHVzZSBycG1zZ19ob2xkX3J4X2J1ZmZlciwgaG93ZXZlciB0aGUgZml4IGZyb20g
DQoyYjZhMzhhOWM2ODkwODY5OTYwZWQ0MWQ2YTFkYzk5MzBjMDc5ZTBkIGFwcGFyZW50bHkg
ZGlkIG5vdCBjaGFuZ2UgdGhlIA0KYmVoYXZpb3VyLg0KDQptYW55IHRoYW5rcywNCnRpbQ0K


--------------b84AGJOHtZtl09aotLowmD0U--

--------------Yo8ecTa4HMDlMgl7jWtRtZXB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSu7kh//RBsHB5C9CwJrmcRco32gAUCZQELOgUDAAAAAAAKCRAJrmcRco32gPoY
AQCcVfYIxXEfkAQ9kb9z8ON0uNd+IfpqOkMGK7HbxubfKAD+InFXbCPVr/4NnuCteZgx5Tuo/84B
0Rf5i1OG6uB0zQ8=
=LnzD
-----END PGP SIGNATURE-----

--------------Yo8ecTa4HMDlMgl7jWtRtZXB--
