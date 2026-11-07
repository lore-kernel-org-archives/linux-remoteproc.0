Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011485;
	b=oby5bn+oo3A/IjT2fbv1NT9ffO6isvHrs799RJ2Hn68yhlJh01aoGyo6YYE1DOAMPiNc
	 7wjP4quxRuxzUMLIr0QNLBIkYPIhmIr2EJhXQWypwQVsbQOckg/OoXPgW/QNd4bnHf0nJ
	 1HLic6CB7/BTSghdKgxdTfzTXjHPX+RACo1U/6+d5OWIz93i1Uj8TqLtOb1Cy3TBuJPpt
	 JS/C45FH0FDBf3og+hrLid83JvZ+i+zUvMAtT7lhTdMD1Ww179Q7uzXX0CGkzme8PNCGS
	 EkX/Soqg2wJorra11K5TWDg1yBp1OYMAEy0lbmRfUHdyuAuW1lHghDq7X9Z8SB7D5Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011485;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=B0lhdTIv2RJ0Nk7yZOY6c6n/tT6BIBcM8LFtVJo3BXw=;
	b=2mBw6IJ2bvdj/D9s9pV3yR5w4d45iMiqllCs0y3Aemj3ujdIvns/XWDEkS5mlxFY5ODK
	 a4AIK5RvQ0eQAzVYZ5Nc0QC7s0fMtYtnd6f3kTL/F6jjJabwGQO9nwHjtbtA3WIEfoD6p
	 K29cOWtiOKtdSwQ0DV5YbfiGUXA7MlYxpwNB9Tx4G2a54THkzTYI7N3+0ev1lcqrsGhTL
	 XOvQxDmMyvdkRTyiZTl9yqstruQKNgneLNFu5AWvKjX+tf5GZz/J0gABJkRaWU6fYiPFH
	 QjYNugHzkeUcm3DMNK6ZlkmFjs8z4MntJphnRAbQYsb6ndWaq/W/UIvvE/B9mzNl/5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZzOiPwd;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="s/PvKbQj";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9A0606A32C
	for <linux-remoteproc@vger.kernel.org>; Sat,  7 Nov 2026 00:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A9A0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TZzOiPwd;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s/PvKbQj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=B0lhdTIv2RJ0Nk7yZOY6c6n/tT6BIBcM8LFtVJo3BXw=;
	b=TZzOiPwdIXrA7gtycvMSfD7/SRcQGWY1v289opOJc5BfMg8v5bJ8A8NBt724JpePOcdUAO
	78d/oXmbScNobJsSfZ2muYYHfXP8nOvJxvuuo0scJr9B+FyfkcERoQiSz2WKbCtQoZNHR1
	rqnuLYwk6y5GtBhxxuh/IHRe0wpFRuk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-JwDb3PwFNLy2SE8azxudLQ-1; Fri, 06 Nov 2026 19:31:22 -0500
X-MC-Unique: JwDb3PwFNLy2SE8azxudLQ-1
X-Mimecast-MFC-AGG-ID: JwDb3PwFNLy2SE8azxudLQ_1794011482
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91ea71789d8so32243426d6.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 06 Nov 2026 16:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011482; x=1794616282; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B0lhdTIv2RJ0Nk7yZOY6c6n/tT6BIBcM8LFtVJo3BXw=;
        b=s/PvKbQjIaCmL1s+Kf7r70RsE+aF31+Oo+18MylQgu1oPJnN47l9rvUJ9v34BD9W+G
         7laXGU2QnAxKa8OVRu643xNemdc2egLlUW1Ks4/NMCN6mSAfxnuDmOg4GlOeKQ9SoFDH
         UWDesJVkMoVzaLwakWza687fnpwEPaELY0tGNeluEQ1AfC7q+Z79qP+kjdKv3kyBKZb+
         3w4IEzbLKWhFQjglCaKzES6n9slR09YDN9h8/aLt8ozqmyqIG5z6agyJo45IylgV4oh1
         GGe5RAVx6Hf3QMXDR/XA/rirQFaR0kyhca4d7HLoTOUzv+ruwT+Uo6WKuTIITUVsVov1
         PBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011482; x=1794616282;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B0lhdTIv2RJ0Nk7yZOY6c6n/tT6BIBcM8LFtVJo3BXw=;
        b=fqOpRp7mpwjObXsNE7kZC9CGa/uY2rwSHgIaXm4shrxGxQXEajRGuVoDVHjm8OedjZ
         hPDDzw6Q2hK1zXcW7f8lqDanCgtFV38j84v3B8a51yaSqa+VxAsEs0IXUfWzP7eyiLQZ
         tZKmI+2CHiglftLG94XVB6YdNoJhrPocqvFAqeFSv6MZLOxXWAAKrjS7jLzpXOFrhlex
         Qi0yolOqzniPdoxMEZ3TgRzbMmS3WTLYpeFwpCxbj+uCAagbgfr5cZH7saeYfRpXkvfc
         xXWYvOQhhgtAA6RK3+Qu3/N/UftvNQBCc8N8ApTZD8txaJoDl9pdZ1Nk02wzisH8LG1W
         dnWA==
X-Forwarded-Encrypted: i=1; AL+hErHBl6f8FyfvoKm+53zX+bXIzSEr09JYhLKIClLC+2RiRuEybRa6kVHOXFD+x8CzBFIwgxOFFBpP1sf2BfWw/IML@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ax7vH6HqsmWxHU5t2zMQRpW57/DQVGweFa2E2Nw18bepVY5GV
	iD9uhCMZVuSZNzbFGW+lAOfkPFdeYbpJPfS+2CnsIk06lY4omCo7dqFiye1QPRyLYdlqfwFphcY
	APOqyr/rJGf053bvdjj4jabjGN/38GtSJvcLsSPEsqKIxvORpnumwui2xC2u7pzdLJV5+zNA=
X-Gm-Gg: AYBFou0l+bOxJOupuhxd9JH9BEo4asA2uH6zNhq4RNcCWQ7lx/ka6RvokQZJrPC4BMP
	CC07b48EFIy1P5+4wTDvptIHSlIVbKn/j9aUTDxKgamir8meRSvoGvon58mii+IlnE1Xd6YWDfD
	SFdn9m4LJkqUp1HcYIbD+CQDdhmO+eZ7/tRb3PgkE8oLxyRX84IPVMCQIaWwccwhD7L95OvQsOH
	2jIDfk7qm2DlXJa3t4CjOzaWkrIsXX6lwnSspIAFy1iSQY2Vr63XZn1/MC4mPPgr3W7Q4m9b39m
	Of8MQg37CaPg+tH3Uem9ydO5Hfli7rM/6Vrep15gfdGEQD+0xo3lUcGFD/VIQNol1YU3xLG2rsI
	0NsU/9EwnuKceIuie+Ue5NfP4Gpktu64Dth44Ez8ho7UDBs1Z0upzxj0Gbdv9SEiYDrSD8s2ARR
	36CSr2BbD2Sz82altk
X-Received: by 2002:a05:6214:3016:b0:91e:9b7a:7f12 with SMTP id 6a1803df08f44-91ea96a599bmr57139666d6.9.1794011481725;
        Fri, 06 Nov 2026 16:31:21 -0800 (PST)
X-Received: by 2002:a05:6214:3016:b0:91e:9b7a:7f12 with SMTP id 6a1803df08f44-91ea96a599bmr57139336d6.9.1794011481139;
        Fri, 06 Nov 2026 16:31:21 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6a2c5cesm32490556d6.14.2026.11.06.16.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:31:20 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 06 Nov 2026 19:31:12 -0500
Subject: [PATCH] rpmsg: qcom_glink_rpm: convert to subsys_platform_driver()
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-rpmsg-subsys-v1-1-c13666cf5678@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWWvSqcvCq4iF1mAkLukgRLy7Y
 vkl5/wXCHkmgSK6wNPOwvMUgHEErq+njhQ3wWC0yRF1rvwySqdks3KKQmNtozOT6gQhXBZPLR9
 frqx+h+VAbn0bcN8PMb0YgXAAAAA=
X-Change-ID: 20261106-rpmsg-subsys-12bbd0524031
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=zDSabrd/5Mwlu683aLMSHp+YFB2DVM8Y3Ir2NXH8Zw0=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFYZwXJjtcnDNzaSH70tfenM+ODn7fJD3rdYfGqE+t
 m6v/72X7yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAiDUmMDKdv2maZXDzZM71N
 surpkSeij53ExG9lWK10cj/UOp1j2hZGhtOLwk7euq0UaLVo4V+Zh92Nu3wsD/b7SbGkOogf+xG
 wkRkA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in this driver and convert it over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/rpmsg/qcom_glink_rpm.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_rpm.c b/drivers/rpmsg/qcom_glink_rpm.c
index e3ba2c63a5fc..5e60d5cf97e6 100644
--- a/drivers/rpmsg/qcom_glink_rpm.c
+++ b/drivers/rpmsg/qcom_glink_rpm.c
@@ -388,17 +388,7 @@ static struct platform_driver glink_rpm_driver = {
 	},
 };
 
-static int __init glink_rpm_init(void)
-{
-	return platform_driver_register(&glink_rpm_driver);
-}
-subsys_initcall(glink_rpm_init);
-
-static void __exit glink_rpm_exit(void)
-{
-	platform_driver_unregister(&glink_rpm_driver);
-}
-module_exit(glink_rpm_exit);
+subsys_platform_driver(glink_rpm_driver);
 
 MODULE_AUTHOR("Bjorn Andersson <bjorn.andersson@linaro.org>");
 MODULE_DESCRIPTION("Qualcomm GLINK RPM driver");

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-rpmsg-subsys-12bbd0524031

Best regards,
--  
Brian Masney <bmasney@redhat.com>

