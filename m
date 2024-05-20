Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5979620EB;
	Mon, 20 May 2024 11:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716204450; cv=none; b=uhDLHpCSXqecXcqB7bWiGsvlU66pMJz1eIe1fxpzCFtbn6NH3cNAxGBMFy0PoRV82dUMpT6o+cGKhAgEmQZRdDlG5Pk+Do2bj95XfJDtnhuu8Mebkeq5tHs/BPGhfJ5j4pRyXD96L+3g/As5OQSOrT9L7jdaO1JxT0ircUZk01o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716204450; c=relaxed/simple;
	bh=TugNqe9PlBp1NJ5MSXmFZQM1MVvwZOYkkhks49lJzMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DD9jinDQqwWn5Fvox/0vISKfJ8iJmtA8Zd5g5zxN96vlPFe3f9bMqe7k42iNJv9Z05tYRBpZeDAjoZWcufFoSn+JuyZtn94H8XEPgphmavLW79ruPzc/QsKChp9MvlqwJXQl5IKBWpcdpgnHf0d5tvR1znUtVT5BIEbfsL1pOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nr8DTS66; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nr8DTS66"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716204447;
	bh=TugNqe9PlBp1NJ5MSXmFZQM1MVvwZOYkkhks49lJzMo=;
	h=From:To:Cc:Subject:Date:From;
	b=nr8DTS66gLZaW4X+w+Uv/tuKcFUStU+GvdhLQPuJsWF6N2J/AeLKzJlaCrbdHeHPV
	 wF5qZXK6qH+0otnO0KZePovIQZ5wUUgttPqRj2H6m8VwcZ1YM8LS4q9WOzzEynsqP2
	 UGGc5ix3SAGst/HSwDWh42aF/JikrXPbYVYLP4h08H4mZC56+mjjvjg2kIOvRI2d86
	 MgcnZoUoZqoaQZOTFxaGXyP8IGMFjEl/KMqob1R81lGCyqGv6cDieiANg5HB1rL4ti
	 /jFfJJ8P5zLGngFoaKGvNEVS/TjoPC0OpL5vzOzwnezaKC7cr81KjZevPwqUQXUDb5
	 F/raaUKoD42vg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D88DD3780BFE;
	Mon, 20 May 2024 11:27:26 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] remoteproc: mediatek: Zero out only remaining bytes of IPI buffer
Date: Mon, 20 May 2024 13:27:24 +0200
Message-ID: <20240520112724.139945-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In scp_ipi_handler(), instead of zeroing out the entire shared
buffer, which may be as large as 600 bytes, overwrite it with the
received data, then zero out only the remaining bytes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index e5214d43181e..dc70cf7db44d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -117,8 +117,8 @@ static void scp_ipi_handler(struct mtk_scp *scp)
 		return;
 	}
 
-	memset(scp->share_buf, 0, scp_sizes->ipi_share_buffer_size);
 	memcpy_fromio(scp->share_buf, &rcv_obj->share_buf, len);
+	memset(&scp->share_buf[len], 0, scp_sizes->ipi_share_buffer_size - len);
 	handler(scp->share_buf, len, ipi_desc[id].priv);
 	scp_ipi_unlock(scp, id);
 
-- 
2.45.1

