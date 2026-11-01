Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=185.56.87.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793575629;
	b=5V43Q57d9TsRyfiQtv1O8sDb3jmAIxbXP0USILgKKtaEnngILsRWdb5cng3tq25GY/Rr
	 98+E+tV14/MSzaEySp+9ZB6ETZNW/EiWnVrRtkBJlCemPoNBBQBhqKzJU0tKNtql9Nd9+
	 BaBYQLGbfbgYWA5B3hp3IlfkoDA3ZW7Al6unPKEC+LhnOL73FF7KoyD7QmSgpL4XaMhIf
	 UygMcWzOcW8tVWsoNa2sKcP3xxs2p0FfOPpf3XrmpMaHODwLLbpd2IK58SCRGkfti/Mse
	 ytl6re7RJ9Q5Y2r3o1lCxyE8y3rnDjPfcA0i7RrASx/22wCG45DfU/WgglCjfVE7wsw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793575629;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:From:
	 Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-Source:X-Source-Args:
	 X-Source-Dir:X-SGantispam-id:X-AntiAbuse:AntiSpam-DLS:AntiSpam-DLSP:
	 AntiSpam-DLSRS:AntiSpam-TS:CFBL-Address:CFBL-Feedback-ID;
	bh=ArrI8itSWDzmfngH4qZZ7PdfHBBqv/lEEVzlHWiKfAM=;
	b=nlNY3T+Og1GQaYZ7fHJakOVvwOKHAU1V0gqMeIqAAKDatWAGRwmwn7K2Xe/mWNBjG9lb
	 z317bAkEMdpqQ/YPaBbKKvjC7kbcRiOSjqhziooM05UTeeU7BVf0j3XrRSdSjNcCR+Wfg
	 SQegipK3jroGXXKaYzm+Cr7DwnhE5nVBdrYuFgPlSuO/jAldac9+j3z9s0DIoxffWfRe3
	 jLhjwxV9bzqP9tyAfln43+uCT1TXP8w43hCOSdmjDJ2IeNK5uVROCoVk8uKMgmMcNDTil
	 T9WM5Io+824Ht4rHh93opab2gBXFF12aur04bi2dzWUji0ydLZJxjYIoUCauw7o3wEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=valla.it;
	spf=pass smtp.mailfrom=valla.it;
	dkim=pass header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=b4qW5FkB;
	dkim=pass header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=I0lGjdE2;
	arc=fail smtp.remote-ip=185.56.87.1
Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4DE606A329;
	Sun,  1 Nov 2026 23:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F4DE606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.a=rsa-sha256 header.s=default header.b=b4qW5FkB;
	dkim=pass (1024-bit key, unprotected) header.d=valla.it header.i=@valla.it header.a=rsa-sha256 header.s=default header.b=I0lGjdE2
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575628;
	 b=WT49jk3pcDOmFBkbclIUWhBASaDK0U9jt50yQRvN6qDSEk6JLpKX6jQlaxmNC6eUPknkRXdCaT
	  C0F+zTMQitVa7hYvh8TIC72saVMkhqluBAsNHXg8g1Uwb6+pvvrVN2yKh3qkWEGvPunowJL6g8
	  XG2YYD2N09TUZKYKz5RlM3WgEkUc0O5Ks+PrfvCiWW6BsAkSEWAUlO4Ojl8EENe4TqGpzvcHtl
	  aJOz9rlDXJY5fniZpiyhkp2/g91JKlsKNT+BupPvzDHpRYIewsizVbspWnJ/0ickNTCrCjynW6
	  afCsyrA8+3LYFeI7k+D8ewg9Xw4+KS7ZjOCVBUuKH6vMfQ==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com; s=arckey; t=1793575628;
	bh=/v3QbkOJjm46JRezLWy98832CA7UTUXqY+qRLu2v8vg=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=uCFk171s8qZcCnPQb0w3LigRIAxJRnEKk/nMUa9Fl6AWGheQG2t0W0k4geBVJPsQ7/goDg7Nfm
	  GpfnaM2U8pj34z5q7dJMI5kkz4A5e+LgX+k0m2mkMEdMxJsG7IYd+657lxhtlYpnS3CVr3kQpP
	  J48HVQl9GFZebZU3xOXqEDL4Yv6BuGjxyxjynIrPEPeG71YXWedns/d9a0qTRxgE1aYxkeCXS3
	  HcX0S02h/mNBPHNQLiITyAyARNmf5jK/7bYxfCuwhwAdX+AMoZOwfCZ7mk6nXdnivPXzZl0PgO
	  H5EQlPBTtx5AXWTO481yelDJGLR8iO4olRdFPn7r+Oy/Sg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=ArrI8itSWDzmfngH4qZZ7PdfHBBqv/lEEVzlHWiKfAM=; b=b4qW5FkB6LnvXYQHojEwt2uJvB
	8f+Ul5IUzjUfkMjVLLZwijFQqVbCFpvfEOiuz9AGPLuB8PQ5krEzfmghUXWLkB3wbzSKyuqJM4nX6
	Fp1NoDsgPqgrEEuke4tVBhQOqiWVqjkJETznxE8p9Y2KoQ9qmVyK2vaiyn7FEOXHe0YE=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNex2-00000007AdW-26tC;
	Sun, 01 Nov 2026 23:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=ArrI8itSWDzmfngH4qZZ7PdfHBBqv/lEEVzlHWiKfAM=; b=I0lGjdE2pet3UPmDiBRzBCOLyP
	fSXPfjau6Xn4qBuJtzNqgTs391ybcqKBdqbWU8WSXmxkADJTRKc+lBScomsXiyaXcqgReQnq4tVt4
	VHSfPKivsc5rBGqftNsU3XbTF7ag4xl4Y/hQl4PG/zJ8FtAF0C2bWOGDF7FGHgPANbU4=;
Received: from [79.17.15.196] (port=60226 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <francesco@valla.it>)
	id 1xNeww-000000002I5-38to;
	Sun, 01 Nov 2026 23:26:54 +0000
From: Francesco Valla <francesco@valla.it>
Date: Mon, 02 Nov 2026 00:26:38 +0100
Subject: [PATCH RFC v2 01/11] remoteproc: virtio: cleanup
 rproc_add_virtio_dev error path
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
Message-Id: <20261102-remoteproc_virtio_map-v2-1-26b300e01c62@valla.it>
References: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
In-Reply-To: <20261102-remoteproc_virtio_map-v2-0-26b300e01c62@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Francesco Valla <francesco@valla.it>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2076; i=francesco@valla.it;
 h=from:subject:message-id; bh=/v3QbkOJjm46JRezLWy98832CA7UTUXqY+qRLu2v8vg=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFnPT+2ele7L43Iy/N72xt83F3rbfsv19J67Mj7eS3htg
 4+Sc+PdjlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAizEIMf8WuuTGqvk54FSBc
 dGbG2hQh78543+J3IhHh3mfbG57GvmZkOL0lufzB9Ycv8jV704OmN3vz1Ju9i8jYLsan38j9S72
 PDQA=
X-Developer-Key: i=francesco@valla.it; a=openpgp;
 fpr=CC70CBC9AA13257C6CCED8669601767CA07CA0EA
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: 97ae101fb9e9db30087856bd0ac2e34e
X-AntiAbuse: ID - 97ae101fb9e9db30087856bd0ac2e34e
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1xNex2-00000007AdW-26tC-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nzm1.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

There is no cleanup to perform in case an error occurs inside
rproc_add_virtio_dev, so remove the goto label and just return in such
cases.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index 12f55a81cfa0..a86c9a949e4c 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -386,9 +386,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	int ret;
 
 	if (rproc->ops->kick == NULL) {
-		ret = -EINVAL;
 		dev_err(dev, ".kick method not defined for %s\n", rproc->name);
-		goto out;
+		return -EINVAL;
 	}
 
 	/* Try to find dedicated vdev buffer carveout */
@@ -404,7 +403,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 								 mem->of_resm_idx);
 			if (ret) {
 				dev_err(dev, "Can't associate reserved memory\n");
-				goto out;
+				return ret;
 			}
 		} else {
 			if (mem->va) {
@@ -422,7 +421,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 							   mem->len);
 			if (ret < 0) {
 				dev_err(dev, "Failed to associate buffer\n");
-				goto out;
+				return ret;
 			}
 		}
 	} else {
@@ -441,10 +440,9 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 
 	/* Allocate virtio device */
 	vdev = kzalloc_obj(*vdev);
-	if (!vdev) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!vdev)
+		return -ENOMEM;
+
 	vdev->id.device	= id,
 	vdev->config = &rproc_virtio_config_ops,
 	vdev->dev.parent = dev;
@@ -457,13 +455,12 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	if (ret) {
 		put_device(&vdev->dev);
 		dev_err(dev, "failed to register vdev: %d\n", ret);
-		goto out;
+		return ret;
 	}
 
 	dev_info(dev, "registered %s (type %d)\n", dev_name(&vdev->dev), id);
 
-out:
-	return ret;
+	return 0;
 }
 
 /**

-- 
2.56.0

