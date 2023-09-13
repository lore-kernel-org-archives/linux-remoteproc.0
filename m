Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E167FEE3F39
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 01:11:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbjIMBLw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 12 Sep 2023 21:11:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjIMBLw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 12 Sep 2023 21:11:52 -0400
Received: from klingt.org (mail.klingt.org [86.59.21.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BF2710F6
        for <linux-remoteproc@vger.kernel.org>; Tue, 12 Sep 2023 18:11:47 -0700 (PDT)
Received: from [192.168.0.108] ([202.184.201.145])
        (authenticated bits=0)
        by klingt.org (8.17.2/8.17.2/Debian-1) with ESMTPSA id 38D1BcS33611658
        (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
        Wed, 13 Sep 2023 03:11:40 +0200
Message-ID: <d2a303ad-4dcf-de52-38db-53695169fe33@klingt.org>
Date:   Wed, 13 Sep 2023 09:11:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
Content-Language: en-US
From:   Tim Blechmann <tim@klingt.org>
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
In-Reply-To: <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qH57659Ztpmn0UL5Hr7oWJtx"
X-Greylist: inspected by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Wed, 13 Sep 2023 03:11:41 +0200 (CEST) for IP:'202.184.201.145' DOMAIN:'[202.184.201.145]' HELO:'[192.168.0.108]' FROM:'tim@klingt.org' RCPT:''
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (klingt.org [86.59.21.178]); Wed, 13 Sep 2023 03:11:41 +0200 (CEST)
X-Virus-Scanned: clamav-milter 1.0.3 at es.klingt.org
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qH57659Ztpmn0UL5Hr7oWJtx
Content-Type: multipart/mixed; boundary="------------BFAhzGqORVEJryOnfqKGjqxf";
 protected-headers="v1"
From: Tim Blechmann <tim@klingt.org>
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Tim Blechmann <tim.blechmann@gmail.com>,
 linux-remoteproc@vger.kernel.org, agostino.carballeira@native-instruments.de
Message-ID: <d2a303ad-4dcf-de52-38db-53695169fe33@klingt.org>
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
 <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
 <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>
 <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>
In-Reply-To: <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>

--------------BFAhzGqORVEJryOnfqKGjqxf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gOS8xMy8yMyAwOTowNywgVGltIEJsZWNobWFubiB3cm90ZToNCj4+PiB2aXJ0aW8gZW1p
dHMgYSBmZXcgdGltZXM6DQo+Pj4gW8KgIDQwNC5YWFhYWFhdIE5vIG1vcmUgYnVmZmVycyBp
biBxdWV1ZQ0KPj4+IGFuZCB0aGVuDQo+Pj4gW8KgIDQwNC41ODg3MjJdIHJlbW90ZXByb2Mg
cmVtb3RlcHJvYzA6IHZxIGluZGV4IDEgaXMgaW50ZXJydXB0ZWQNCj4+PiBbwqAgNDA0LjU5
NzI0OV0gdmlydHF1ZXVlIGludGVycnVwdCB3aXRoIG5vIHdvcmsgZm9yIDZkNTNmMTNhDQo+
Pg0KPj4gRGlmZmljdWx0IHRvIHVuZGVyc3RhbmQgdGhlIHNjaGVkdWxpbmcgd2l0aCB5b3Vy
IHRyYWNlLiBDb3VsZCB5b3UgDQo+PiBlbmFibGUgZnRyYWNlIHRvDQo+PiBvYnNlcnZlIGl0
IChtYWlsYm94IGludGVycnVwdHMscnBtc2cgYW5kIHZpcnRpbyBmdW5jdGlvbnMpDQoNCmZ1
bGwgdHJhY2UsIHRoYXQgbXkgd29ya2VyIGRpZCAocXVpdGUgbGFyZ2UsIHNvIGkgemlwcGVk
IGl0KToNCmh0dHBzOi8vZmlsZXNlcnZpY2Uua2xpbmd0Lm9yZy9kb3dubG9hZHMvMTU1MjY5
NTE2OTQ1NjczOTMxODAtdHJhY2VmdWxsLnppcA0KDQp0aGUgaW50ZXJlc3RpbmcgcGFydCBz
dGFydHMgYXQgOTA3LjIyNDQyNTANCg0KbWFueSB0aGFua3MsDQp0aW0NCg==

--------------BFAhzGqORVEJryOnfqKGjqxf--

--------------qH57659Ztpmn0UL5Hr7oWJtx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSu7kh//RBsHB5C9CwJrmcRco32gAUCZQEMSgUDAAAAAAAKCRAJrmcRco32gFsz
AQDAAf0tbIi6FFfmbdA+rpuHf+LcunqUb4jA3asbUDIztwD+Iiud2S1rZv9uMh3zFiJw2LXt1vbW
ELZzcWVX/h7fDws=
=2pCq
-----END PGP SIGNATURE-----

--------------qH57659Ztpmn0UL5Hr7oWJtx--
