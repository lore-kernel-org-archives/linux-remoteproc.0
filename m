Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04AA4FDE77;
	Wed, 16 Sep 2026 21:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789593123; cv=pass; b=Da1NzjKe9dX+bqfN0Jzlv2n9Pr8JQAPWsTy9PaOuO1g+ExfSYJP+W5xthpl/XzX8Cga79BDd7TMZaWcevLpYW/6beBAgbhKVEhAXt83mg3XtZEmTF1AunmU/PnGUghmm8dbyJxMQHfuugKTTYoG5QxuLnFSvoha+J06n0Z41ecc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789593123; c=relaxed/simple;
	bh=UuqIVsdecwPwN8w0AomaFDbkgOyPw7g1ZVINhxzOqUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dt4UP8TbvLq6NJ0dZFnuxJ+SjWUnW0GMtRqB8hITlWyRocl9KH1NeouJt+Na78Ch5OauE7Fds4RSmbDJ3ndTNfkmwoI/z1rcdaEbsWZQ+nS3OmcpuFu+BxdwR3PH8DJhczrQXwhyr/3yE9Fl+ZiulSA8vq12zVAd54vKjaXqXUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=KxL2DBzz; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=quUe1ey5; arc=pass smtp.client-ip=185.56.87.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="KxL2DBzz";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="quUe1ey5"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789593107;
	 b=h3i6/p9FDWUTkOLwQ+Npa1bpvXm9CvH1YX0vSTpinaiPk28g3NtvIdeAqDYxlcFMx8hFqxZdP1
	  MY3NVfGJJsojCZmYdMhwg6TVEZFjWz7aYgujBX4Sq66C3I+nOjGKjec4WMJMl+Gicbkw9PDIYv
	  Z9eJjWEf7zAxxmhVUSx24eUUSo1F2mRiT8irfgguPpNrhlBYnSqX/rBsUEkNwY4cv7iqRzsywb
	  ZZ0Jj/0yMcPg+uHEk7MqtHiZDZ1lMGs+IW3LBBHEo+nSvNVTR8fg5bCz98RMaevMeMWcWVGvHS
	  kDxzagy/nQgRJ9/J1rA5R8mo7+o+2nVDkyxF+lIFBdMv7g==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com; s=arckey; t=1789593107;
	bh=UuqIVsdecwPwN8w0AomaFDbkgOyPw7g1ZVINhxzOqUI=;
	h=Cc:To:In-Reply-To:References:Message-ID:Content-Transfer-Encoding:
	  Content-Type:MIME-Version:Subject:Date:From:DKIM-Signature:DKIM-Signature;
	b=KyGm8dkmgEsU+Zk8gf7cFnX5YIK2PwxdysyTI73my6hr5teBkExF69Cg6sUgNzYByYxCIE4JNn
	  7trPlWwrmk/WNnKPlHgEf2ogqLHPcklBqDkElZS/Kd4qcTrSVX5mPVOJQrABr57RZq5kMbkxbX
	  m9RG/h5ANdntoWrIahS7pY9ERO0hTl7cAAthY8Gfg+qhIT0/xz5JlvNfJBvjTgxOJlya9QuEQs
	  V4kvWE2//eMFvPbfpMKbXYARnGAVgh9ezBZsGYIRLiSMWza9bYT2y+41KgqeOuR8hLHwLDvz5d
	  9IKpZyRjlb+BwFgRKcCnkvHeCyQEVtYEIXGjNJcDSZyGHg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject
	:Date:From:Reply-To:List-Unsubscribe;
	bh=+OJJf0zimOPJzB7R6o40fNU2QqeDCYrBYo23IsRVzJQ=; b=KxL2DBzzXk2RcFSO9+/eIbm0f6
	WTqtnXYE1FTK5+8YzyyRJlESoPEvtUcnv8Kp0Ru96gSAv3FAit3PsIJweHsaR1U+pkUYglSZ0oGYU
	cTldph2fEn2npeN9zkFzpi5emF0xbFMvkOSlrDdxt/RX4lI3Zh13n63NSL1vZp8EnCnQ=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuV-00000009sBU-3SPa;
	Wed, 16 Sep 2026 21:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Cc:To:Subject:Date:From:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=+OJJf0zimOPJzB7R6o40fNU2QqeDCYrBYo23IsRVzJQ=; b=quUe1ey5u2pIYbtCFwfrE8myz5
	fnBxgNazPAjyLjs+WOdXYs5ld4gTIlY3Y5Vf7xwwvgkKd9QrrPJQjD5RaanYKGGr2J9KJqDVmWl99
	OXuwmh/5JQRAx5848Azec4sMkfDTUd0j71riHaq6CsJQkzmA+1ZqOyS1LdtV3Wbf8iho=;
Received: from [95.233.221.121] (port=62880 helo=[192.168.178.175])
	by esm19.siteground.biz with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.5)
	(envelope-from <francesco@valla.it>)
	id 1x6wuQ-0000000058P-2gXw;
	Wed, 16 Sep 2026 21:11:14 +0000
From: Francesco Valla <francesco@valla.it>
Date: Wed, 16 Sep 2026 23:10:54 +0200
Subject: [PATCH RFC 09/12] remoteproc: search for a fwnode during vdev
 registration
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-remoteproc_virtio_map-v1-9-dac8c5eb4aa9@valla.it>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2406; i=francesco@valla.it;
 h=from:subject:message-id; bh=UuqIVsdecwPwN8w0AomaFDbkgOyPw7g1ZVINhxzOqUI=;
 b=owGbwMvMwCX2aH1OUIzHTgbG02pJDFmrWZ9wxq3y7C77Wf/CNGGixZsHl/4lKDL+/cVsXn5An
 l0ucfWajlIWBjEuBlkxRZaQdTfu7Zlr/i1tA+MjmDmsTCBDGLg4BWAimy4yMhw67+EqF3HU6tj1
 9vXbfx2YV8Xx2fugMu9iq6jP5x6cP8PDyLDn1bXwOtvIsmtxix8eWfTqX+JPNo2ChSqTr58LNJc
 0MWQHAA==
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
X-SGantispam-id: 38727b3654ee60d1c78c3d34062cead4
X-AntiAbuse: ID - 38727b3654ee60d1c78c3d34062cead4
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1x6wuV-00000009sBU-3SPa-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-3zv2.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

The virtio subsystem already supports a fwnode describing a vdev; search
for a specific node during vdev registration and supply it to the
platform device that is being registered.

Signed-off-by: Francesco Valla <francesco@valla.it>
---
 drivers/remoteproc/remoteproc_core.c | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b7d9957534bf..e3ecc61cc1de 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -440,6 +440,29 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
 	if (rvdev)
 		list_del(&rvdev->node);
 }
+
+static struct fwnode_handle *rproc_get_vdev_fwnode(struct device *dev, int idx)
+{
+	struct fwnode_handle *group, *child;
+	u32 reg;
+	int ret;
+
+	group = device_get_named_child_node(dev, "virtio");
+
+	fwnode_for_each_child_node(group, child) {
+		ret = fwnode_property_read_u32(child, "reg", &reg);
+		if (ret)
+			continue;
+
+		if (idx == reg)
+			break;
+	}
+
+	fwnode_handle_put(group);
+
+	return child;
+}
+
 /**
  * rproc_handle_vdev() - handle a vdev fw resource
  * @rproc: the remote processor
@@ -475,6 +498,7 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	struct device *dev = &rproc->dev;
 	size_t rsc_size;
 	struct rproc_vdev_data rvdev_data;
+	struct platform_device_info pdev_info;
 	struct platform_device *pdev;
 
 	/* make sure resource isn't truncated */
@@ -504,8 +528,16 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
 	 * as device id, then we get duplication in sysfs, so need to use
 	 * PLATFORM_DEVID_AUTO to auto select device id.
 	 */
-	pdev = platform_device_register_data(dev, "rproc-virtio", PLATFORM_DEVID_AUTO, &rvdev_data,
-					     sizeof(rvdev_data));
+	memset(&pdev_info, 0, sizeof(pdev_info));
+	pdev_info.parent = dev;
+	pdev_info.fwnode = rproc_get_vdev_fwnode(dev->parent, rvdev_data.index);
+	pdev_info.of_node_reused = true;
+	pdev_info.name = "rproc-virtio";
+	pdev_info.id = PLATFORM_DEVID_AUTO;
+	pdev_info.data = &rvdev_data;
+	pdev_info.size_data = sizeof(rvdev_data);
+
+	pdev = platform_device_register_full(&pdev_info);
 	if (IS_ERR(pdev)) {
 		dev_err(dev, "failed to create rproc-virtio device\n");
 		return PTR_ERR(pdev);

-- 
2.55.0

