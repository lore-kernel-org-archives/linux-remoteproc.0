Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF69223DCE;
	Mon, 23 Mar 2026 07:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774249480; cv=none; b=GSIGQ33t5B4tok3i9CTVXP06mIXcB81CRtfbldekaiYGcSmlomVhs2uEIF8kX/fJX6LY+/kIpNzK+JBk4ysMKkqnIQdAe+gQ3MKCQxHcFP8JU06tzY89CZNLGcfIRf5TFTxlBBlzjJhMIkvnnIFhC4T2kwPilaelxYSVqtOSDlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774249480; c=relaxed/simple;
	bh=GfBvqqAgM0czqvKEf99RG7YCHROyg41fa9JjRAeJ1eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JP0RYC4yFhB0LxHovKpT7a6sDTdCJ7G0tZzkZaSBJBoqUtI9NEivTn0ITeaBpCjoOC6F3zv3jTeF9S6skH3trrd67jeZlLZR9mmiW5fbln7aSWGGESlyflwvj2QS42lvzkiAcQQWQ8HOJ+7RcSJ1G/EKueLQO0eUwhhVkyyPLEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.197])
	by APP-03 (Coremail) with SMTP id rQCowAD3Etqx5cBpfwWGCw--.11493S2;
	Mon, 23 Mar 2026 15:03:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: andersson@kernel.org
Cc: mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pengpeng@iscas.ac.cn
Subject: [PATCH 6/7] remoteproc: validate resource table offset count
Date: Mon, 23 Mar 2026 15:03:13 +0800
Message-ID: <20260323070313.42933-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3Etqx5cBpfwWGCw--.11493S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF4kWr1xtFW7ury7KrWUCFg_yoW8JFyrpF
	s3XayIkry5GFyjqFsrAa4jy3WfXw1UGFy3Kay3G3ZaqwnrAry8J3WrCryfCFWUJrn0qr1U
	JFWYyw13ZFZ7AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6v38UUU
	UU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

rproc_handle_resources() trusts table_ptr->num when it walks the offset[]
array, but it does not first verify that the loaded resource table is
large enough to actually contain that many offsets. A malformed firmware
image can therefore force the loop to read past the end of the table
header before any per-entry bounds checks run.

Reject resource tables whose offset array does not fit inside the loaded
section.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/remoteproc/remoteproc_core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b087ed21858a..47fdfe5c2124 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1022,6 +1022,12 @@ static int rproc_handle_resources(struct rproc *rproc,
 	if (!rproc->table_ptr)
 		return 0;
 
+	if (struct_size(rproc->table_ptr, offset,
+			rproc->table_ptr->num) > rproc->table_sz) {
+		dev_err(dev, "resource table is truncated\n");
+		return -EINVAL;
+	}
+
 	for (i = 0; i < rproc->table_ptr->num; i++) {
 		int offset = rproc->table_ptr->offset[i];
 		struct fw_rsc_hdr *hdr = (void *)rproc->table_ptr + offset;
-- 
2.50.1 (Apple Git-155)

