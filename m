Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173109;
	b=cbpoTzE6UoobWFikUVE7ryN31w3Tk+92KhlJ07d1c4XVHQQRUqXfbG26hdZbrCO2fzn9
	 Uk1OjB7LgyzwXySW79g2Fwuc1+usi13VPfv4s6s+pFv2U22iixdhNFCtG0Ce/FTbg41Ts
	 v4qRdaL30zI/7JWKHMl5uyAsFZ9/6Hpj8sHrS2ZLda1nXIBi0/ZPV6IaArtJYjGbY2IIz
	 ZN/+0L7ggzdlPe8oIyeUQyBUFejd2CEWmfPEZhnZZDBwhv+CIh1YyAQIszSVHovehLr8b
	 xYtKNCyC5nLtECK4kJJQIpzWSl283qKyc6xuURB4gKd/4DOnml9mMTnmpIhpLk737eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=obTRZoMpQ6qAIRrTq6RnTHHtEWMkJlC9oP55DlaGsUA=;
	b=fEUVBk7t+uY8BADqCtvfbU2RN9sO9PkpaDoqtvcrMGFJVvvU/ox05l5U+8Ok7IULosgp
	 lYQnGnL3shy+NA1zhB2BLR8ovS9F46SjMW0DtccChqLQOeOFJZIsN9uV2ZG1SnoBvZa4m
	 mb0AffG0MjbAzQy3nrIUHtxbw3XcV1OC+b7phyiPqJSXvA3zOx8ZvhhqHT177lfQnKsFX
	 pf8/d67IclI3TSOnjMmFk/R2VdV4fMUqNxnIMCpGmf/BoRd8kMosdmZlcz8QtuxzS2og0
	 VDtjWNnuuAEMU/1z9D4prlcg3wFdmPygAXExTE6GZGO12pA6afe++ywGP9PuUk2HhNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LutnIuTR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C91060A3801
	for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C91060A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LutnIuTR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso8344785e9.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 20 Nov 2026 03:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795173104; x=1795777904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=obTRZoMpQ6qAIRrTq6RnTHHtEWMkJlC9oP55DlaGsUA=;
        b=LutnIuTRbi2ClZlfZmC5IRFXRssNOhPjO3AHie8sU/QwgtXyls6KNTWXN0OgUK4qtL
         IREsO0eqY7+yrbpLKYrwJdd/OPqb6ZvwCBRIgOzRkaRQ23K4DWiqNH5K6nnleBPWuFUZ
         7Iev9VTBSkF7aQygQpaKeBQt50yCo7bYXAkajq+WBcfaOpuve6zAgRPxQ+3wTorSYw0R
         EEo/6HBUu0yYpRqmM+zp8HYDJb7VNg/A2SIItEb7OzLYvAQKdkS7GH8a+8gITVapGrTs
         Z8RpOeId6P3X2dNSIruUgTH2uYFapsTsx0q1ezHKdEzqHqWTXpDCVaN6b17C5adO+9tP
         vPGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173104; x=1795777904;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=obTRZoMpQ6qAIRrTq6RnTHHtEWMkJlC9oP55DlaGsUA=;
        b=B38DqT9v+l8sk1lFZeLLnB5BcTObWsL2f2GU2N0C5xWMFPs69ZkBcLhd4ca77fqMlP
         PIS8nr8Z5byCZBE+5nRBNiqM8unE2MXAA+cb4EG5CV6ACFxVmJ6kgmGd/pdz/b24yQSX
         Ff+AFOjqoRGEKiViK2hEIGBQjNqArDIX5SlkzTdcjMZsQv3VBo2pw/XbX4s2MR5SngHa
         S9oIh1t19pLUpLQaU5rpzEjsh5I4MZTbS60ILKY3fNzNqWo3iaKOpZi2AA+x99tjSY8H
         12XRpLVYREHg4mSXYCFDPxAosWG8QZoWiW9KdxwdHXb6UNXYBDR8e6Wg2VFv108IZtEr
         +91w==
X-Gm-Message-State: APuU4Z9w9OH7MfrTrzY4Nab/UqEfTYh2Dla7MdlHji6uNTyFBne3gZ02
	nv464R9MY4Nd9ccG4iKLKo6oDs5bsh7Hp+CduKegYDoYj1A3PJxAR7Gkl4p5cudvMPQ=
X-Gm-Gg: AYBFou3SM72CU0NbVO6JexmCeLJCbiQdLOSemPPYgFho14W5Pfapmu9cVergGCRdlsg
	i/eD6yvjbhad9BPPl654jozikmFtJXuHPLi6hrwkPVZA/W72srcH1DjZzMPG40lwN1GaDF/mhzp
	b0NVx5rkXyF8BJciu13tAEwaVB8Kr5JSWeP4mQZgZqwgCQ98OHYV5EYZ7OCedHSo8S1Hi1tG0+4
	AjmZLtmcbvzcUyvygAyYwP0SmWccSjawSMx8j8jlzGigxX2rrD8GCKXimUleOn0leAn7xiGzeMe
	4U+jUMwlR0D7pV85Hmu/pXsvJ+hrlvtHddL0OziXX+kYb+StWeThA2QxdobtoF8/Ai3e/WpkCMr
	RYD4GTylpsmHMN0w/O9JsAtcfMqUnMuycbRJ2KEs18uscMJKnkfiaTeDNyu19Gei1olGurcavz3
	o/ayr+ORe7mBfl3m/PNH9GLhRKq4HtReRI+GS5Fth10s4OzAOroNyfThtmPOMxVuZI+icLDY2z3
	o3gNFxbHMUOmi89ypuYb06RzWFo29bEZfRYILy4zR1DO2Kz/ucofvFOOqAWcefpajUmRTh5Mx6G
	Pfg+C2MeRFBZ4rzqHobjBtUYBCdQiEmek6jhnHbkSM3R3HsW+0scP6yB56kyPgHwZvIhMpymx2A
	+/u55EBNObZUNMaEO
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id 5b1f17b1804b1-4bb8880607cmr55439525e9.13.1795173104435;
        Fri, 20 Nov 2026 03:11:44 -0800 (PST)
Received: from localhost (p200300f65f19a904be03815e1634e776.dip0.t-ipconnect.de. [2003:f6:5f19:a904:be03:815e:1634:e776])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb84e58ab3sm66033985e9.4.2026.11.20.03.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:11:44 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 08/10] remoteproc: Allow untainted use of driver_override
Date: Fri, 20 Nov 2026 12:11:09 +0100
Message-ID:  <b059b4c23302a7e7771069b8b3ce38993c5ef5d1.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
References: <cover.1795171088.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1233; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=VopZDYhLA2P/DlRtVwHcc5vBmPZ/Gf24ucXtKz0CmOI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBrACraXR5WCgD+OAXP3zqGQqAUazBKUp0jyJv9y xMptqzeaP+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCawAq2gAKCRCPgPtYfRL+ TnGkB/9gaILrK9qa8A5PpYexDv02sMlbwv3JOfYXsGdOLazl7xnMUyEorn6qfaqo+2oAjxnkrKC tm9XZep09M82VuLGUU82aCSZNnaWbRaBKWR3Lob98KAMVePCuZCJ2PClc9C6sGxHPnJ2cXi6P7j jtNbOne6fVPM5lSr0s5JDraPCvwn1qV4KluaFpwFBbaUhy3uJvKkMf764Q3ym1/4FzbL+uQmCPF kpe+r2fRHT7YaM/mpziuJOuwcPNU9l/WDoqC05FkafeaZ+C4UE2lLTHcsD5idKSSMIPfh0mK7xk Y5o17vyO/a6mx016CbTmvCBkb88iHZJu+x8+6KYYj/tM/rOQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The two drivers are expected to be bound to devices using a driver
override. (See the respective use of device_set_driver_override()) and
so should be allowed to match via that mechanism.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 1 +
 drivers/rpmsg/rpmsg_ns.c   | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 5c19188d0294..79ae495c9c07 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -210,6 +210,7 @@ static struct rpmsg_driver rpmsg_ctrldev_driver = {
 	.remove = rpmsg_ctrldev_remove,
 	.drv = {
 		.name = "rpmsg_ctrl",
+		.support_driver_override = true,
 	},
 };
 
diff --git a/drivers/rpmsg/rpmsg_ns.c b/drivers/rpmsg/rpmsg_ns.c
index bde8c8d433e0..820dabbc9500 100644
--- a/drivers/rpmsg/rpmsg_ns.c
+++ b/drivers/rpmsg/rpmsg_ns.c
@@ -96,7 +96,10 @@ static int rpmsg_ns_probe(struct rpmsg_device *rpdev)
 }
 
 static struct rpmsg_driver rpmsg_ns_driver = {
-	.drv.name = KBUILD_MODNAME,
+	.drv = {
+		.name = KBUILD_MODNAME,
+		.support_driver_override = true,
+	},
 	.probe = rpmsg_ns_probe,
 };
 
-- 
2.56.0.rc1

