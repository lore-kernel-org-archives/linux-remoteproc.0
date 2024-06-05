Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A4A14F9DC;
	Wed,  5 Jun 2024 19:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717616155; cv=none; b=OCHJsQ+fKdtxeN0J9RoTTnP0lkB/LRf6h75jS3pNlnOqasl9MsNJVqwiGAD67qoqdOf2Ns8hlg3K19Ts2NpYGltUPnJpqdnCUKnchfrD5c5mClgiUXBaWfBuGuXKZafYOpsUVCfbw97I2wkgKLDgix2VtCjvIgiRHFLQB+UUhw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717616155; c=relaxed/simple;
	bh=/OOgdOrNQp1uReXHDPfdGQSEZv1TGjR7OU/fKbfzaD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eDtR5coVZD18kcBFaxE5jUscZ5ERzQgcFtSUaYPZkGV9OzWhPkileNK3Las1PO8oi/zao2a56zldqyKKBkuLrrWAjUo9w/U6OErS+3CYHmP5wRfVcHLs7XXva+WCUzKXx8FMa2OHCPtPa0CQQbPJhcjo4gTs/ZEjne00AsZkrx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=pRspisL6; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="pRspisL6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717616150;
	bh=/OOgdOrNQp1uReXHDPfdGQSEZv1TGjR7OU/fKbfzaD0=;
	h=From:Date:Subject:To:Cc:From;
	b=pRspisL6ZFGD72AhvmkFlChFLPnCLMKYivkNMgGTSVW1fVa3s8f3pr/H0EBiPmlub
	 9rzJRO7+DeoHX+Gv9XIG9AFNPhkBYpHelKf6cd9RFCkB9kletam3kHhL/QhEbQPH8n
	 K69UUfhBH9DQYk5VJgaVrByIB2ustDGamGqmP56XOO9OmzwfW+NQmN/lqHpV+699mq
	 kPN4OyUf4udZJU1i4kkGtJ63y8oRb5sF460GAlbK5/DgmBg9zDeB2hJVI6+q6CT2vH
	 dVH5gmktk63yj4clNSHXM5uIpQaaqZY4w7GqVoXzLvgSd5aFKg3mTnzxcr/Rc8Ex6e
	 TKKaOUL9mSQog==
Received: from [192.168.1.251] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D518237821B7;
	Wed,  5 Jun 2024 19:35:48 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Wed, 05 Jun 2024 15:35:44 -0400
Subject: [PATCH] remoteproc: mediatek: Don't print error when optional scp
 handle is missing
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAA++YGYC/x3MMQqAMAxA0atIZgO12KJeRRyKiZrBKqmIULy7x
 fEN/2dIrMIJhiqD8i1JjljQ1BXMW4gro1AxWGNb443D/eqa3iHtAdN8YjyIkVXRh444WE/t4qD
 Up/Iiz38ep/f9ADxlMk9pAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0

The scp_get() helper has two users: the mtk-vcodec and the mtk-mdp3
drivers. mdp3 considers the mediatek,scp phandle optional, and when it's
missing mdp3 will directly look for the scp node based on compatible.

For that reason printing an error in the helper when the handle is
missing is wrong, as it's not always an actual error. Besides, the other
user, vcodec, already prints an error message on its own when the helper
fails so this message doesn't add that much information.

Remove the error message from the helper. This gets rid of the deceptive
error on MT8195-Tomato:

  mtk-mdp3 14001000.dma-controller: can't get SCP node

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index b885a9a041e4..f813117b6312 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -37,10 +37,8 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
 	struct platform_device *scp_pdev;
 
 	scp_node = of_parse_phandle(dev->of_node, "mediatek,scp", 0);
-	if (!scp_node) {
-		dev_err(dev, "can't get SCP node\n");
+	if (!scp_node)
 		return NULL;
-	}
 
 	scp_pdev = of_find_device_by_node(scp_node);
 	of_node_put(scp_node);

---
base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
change-id: 20240605-mt8195-dma-scp-node-err-6a8dea26d4f5

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>

