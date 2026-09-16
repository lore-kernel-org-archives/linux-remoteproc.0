Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1FA4A5C54;
	Wed, 16 Sep 2026 21:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593086; cv=pass; b=TJip+8eYuRk4K/UZjXASx4ScXbI2en+N/oFhlihvcd+CBzjRkpCEklkDpyyO6X+q045q7VahFTV6JCMip+D9lU0naMDhvsspRK7raIgXTpjj15PqGq/L5hMh6htg3xzPcHQyKPQBupWgE2OmAtig0Zl7+ltCsKWfgV/f2vr7aOo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593086; c=relaxed/simple;
	bh=GA43VkbHqER01zDTwAx5YQK+oTAg4fjkEJYtZq+Av3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AvF2xjqbCMD5PfubBtVR783/8y6veiH4FDcDpM23avKvMzEQkg/CG7PaLE9L2Qt3byoOTYaJS3PaHhkVKlMOHRyvwq5uz2lWWUMkMcw8Sy3MHP3Yy94JoF+lRz0BVpQnnDBy9QPRG1lInY8PuXR0hqvop+CPHsZyzLn/z5k6PtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=yBJJeQKv; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=DF7q3DU5; arc=pass smtp.client-ip=185.56.87.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="yBJJeQKv";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="DF7q3DU5"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789593081;
	 b=pvuUzST8JBmXhxsWxQUGQeFwXD7o2WmRc+nvN63QdApENLzxLnUSyrrVp/OZNRjgqfCXWfH9Rq
	  aP8WOJHZEh50GnJI54yGrJIgePLHXSMvCZXKgUozlcL+WyksxIev/5AYRiRZ4oEw3uFATAfTrW
	  Vr1OQkJo8RlHW4NdC83+0lDEaql+92Jn000XB5DKdjNpUZvQsYJTq/FJv/dh+I/YKg3/T+e4Cy
	  SNkk3nuhWMXN6StB+5MCKVwvakSwxVkVytCaRC0WW37zu8IDq6Ju30cthheHI5iL4cNmbw889i
	  htAN4rJmdPDP+iqlVygomyqg8dAVcng7eooGzZE62qMb7Q==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com; s=arckey; t=1789593081;
	bh=GA43VkbHqER01zDTwAx5YQK+oTAg4fjkEJYtZq+Av3o=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=18jQPi6ztQwu/kalmJ+8sk0vZNUbl8PFlDE3O5dfYi3hfV2bEAhNV6fKqE9ZjoDT6d2mvFlQq7
	  FiuXM+Jk0k5oN5UZZCC8Ls1oET0JbAQFtwpbYz5r5uOf617o35j8qHQgSGXU/QZ5XIVy3lOset
	  dPe3KYqVr7NycZhWQiR3pByU/NP6kj5trM2qJGsH/fPnnV8MbNMeS/bb4YZ0u7wTo5BOFt+yDb
	  tHF1Eh8UvzRYw3g2BbQlSJHOqAcIVjvCi8YN626kXvXfdHdJFCrwzk93z98TM2cPRtOEN9Fvzn
	  01Vcb9y/CZUcr7hqSNmAVVE/ca11huaJrANfbLrbZXIuzg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=0bfi//4iBWflpifsqQu1VKkBu2tJTFizXLg4sdBHJQ0=; b=yBJJeQKv0OjJrRtQktoRbRcIkx
	6ja3RP8GhJZFL4+5r8g4wg7d1hk7SHAWEfzdnrxzZ7OrDRsw1/F4QHzDtcHUHfZqkrAUBFZ6/swZk
	W8cAZ/+JX5cuKB3kxTll/vW9nAdxyBRaYbfYlygODQaIsGnSnttUj9ubdWEw9r7AqMVc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-f940.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuK-00000002DM4-0DWY;
	Wed, 16 Sep 2026 21:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=0bfi//4iBWflpifsqQu1VKkBu2tJTFizXLg4sdBHJQ0=; b=DF7q3DU5LJeHMMSDvxyO4rrxqW
	qWIJk0NYo14ZmYU2P9BItxIUY8RzG74/+He5UXGD5TLl4ACrA4C3gPumz/6Qd6OkYzpZxux31EAJe
	okiQCQ9cLa0eBFsEHDNyLCqWbqjF4gWzSGpfws9bJfsQIO6WsoEy8oSyY0Od73o7Ovyk=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuE-0000000058P-3bHV;
	Wed, 16 Sep 2026 21:11:02 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:46 +0200
Subject: [PATCH RFC 01/12] remoteproc: virtio: cleanup rproc_add_virtio_dev
 error path
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-1-dac8c5eb4aa9@valla.it>
References: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
In-Reply-To: <20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Peng Fan <peng.fan@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, virtualization@lists.linux.dev, 
 imx@lists.linux.dev, iommu@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Francesco Valla <francesco@valla.it>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153; i=francesco@valla.it;
 h=from:subject:message-id; bh=GA43VkbHqER01zDTwAx5YQK+oTAg4fjkEJYtZq+Av3o=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWR8ft9qsOP/6zc0mqevMn+124n6Yp8jQ/WWyXeyha
 9Zb9s481FHKwiDGxSArpsgSsu7GvT1zzb+lbWB8BDOHlQlkCAMXpwBMxCCAkWGuxe+LPYcj5DpF
 F9gUGx7g2BFwMZmnVvqU2R2Nr1cusr9k+F9vfUM6/Nec806yHg8PmRe/Wqz192+OE3te+WPJ61v
 zNjIAAA==
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
X-SGantispam-id: 89108c4e8dbae417962750fde4f5f287
X-AntiAbuse: ID - 89108c4e8dbae417962750fde4f5f287
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuK-00000002DM4-0DWY-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-f940.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

There is no cleanup to perform in case an error occurs inside
rproc_add_virtio_dev, so remove the goto label and just return in such
cases.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_virtio.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d5e9ff045a28..096bcba527c1 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -376,9 +376,8 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 	int ret;
 
 	if (rproc->ops->kick == NULL) {
-		ret = -EINVAL;
 		dev_err(dev, ".kick method not defined for %s\n", rproc->name);
-		goto out;
+		return -EINVAL;
 	}
 
 	/* Try to find dedicated vdev buffer carveout */
@@ -394,7 +393,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 								 mem->of_resm_idx);
 			if (ret) {
 				dev_err(dev, "Can't associate reserved memory\n");
-				goto out;
+				return ret;
 			}
 		} else {
 			if (mem->va) {
@@ -412,7 +411,7 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 							   mem->len);
 			if (ret < 0) {
 				dev_err(dev, "Failed to associate buffer\n");
-				goto out;
+				return ret;
 			}
 		}
 	} else {
@@ -431,11 +430,10 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
 
 	/* Allocate virtio device */
 	vdev = kzalloc_obj(*vdev);
-	if (!vdev) {
-		ret = -ENOMEM;
-		goto out;
-	}
-	vdev->id.device	= id,
+	if (!vdev)
+		return -ENOMEM;
+
+	vdev->id.device = id,
 	vdev->config = &rproc_virtio_config_ops,
 	vdev->dev.parent = dev;
 	vdev->dev.release = rproc_virtio_dev_release;
@@ -447,13 +445,12 @@ static int rproc_add_virtio_dev(struct rproc_vdev *rvdev, int id)
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
2.55.0

