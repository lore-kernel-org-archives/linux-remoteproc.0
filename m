Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5710652F9E;
	Fri, 20 Sep 2024 09:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726823833; cv=none; b=s4UrDdPR5QkZsx9fVsgou6JwoJNFX8eWbIFQsPmzg6zzH3dID2LcK+rT3CSmshah79mMSfuMHEZ9Ijd28P+Zkc6FKYPoddO30o0m9fYoib5zdCfBAKuz8NhG2Gm3coVToNSQf16P0+XPQxuVe+DiTK5OJIrARuGEFEv73Qtpjd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726823833; c=relaxed/simple;
	bh=d7GT5vMcpzKwWm/ocXvn4jG0MI1gpZdptEQLM5+DLdU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IRz8RGWVrYv/X7h/qZX90EP3iU+ZNrfbx3e+6fwbJPK3C6Ezm//RVRZ3aWvmEfqkYuQpEG8+iujnqlAorF/HV2iZOSEVDnVwsITm6hPNbFCljVgLlPHw/1vPewA5TkJbzA+lvbkyupcAPa7JPmhzxD3fCTrREtgH7jqvj07HKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=WYcoQKGR; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WYcoQKGR"
X-UUID: 1b52784e773111ef8b96093e013ec31c-20240920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=fRe1VZ/Qwt/rmp6qCSIHfvjAQpuxXapDK6bFJMZDscY=;
	b=WYcoQKGRU+nF4dpO1oaiIEron4EDROPJuuL+E6NSZsXwx+xUfRwyE9ORc/lDBRzVxg1ubZ/nsee4371DrBj6uVEUV3SpH1eIdBjryns4owjCZvVDt0/XsExprpwBcJEqDXMPXKJ6JPC2kkdqY6q/cYzcj/6yR1h/4LVen+J5y4k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:4ca4e21f-7d19-4661-8676-a0882d12f3cb,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6dc6a47,CLOUDID:e71680d0-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1b52784e773111ef8b96093e013ec31c-20240920
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1596480344; Fri, 20 Sep 2024 17:17:06 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 20 Sep 2024 17:17:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 20 Sep 2024 17:17:03 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, <jy.ho@mediatek.com>, Mark-PK Tsai
	<mark-pk.tsai@mediatek.com>, <linux-remoteproc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] remoteproc: virtio: Add synchronize_cbs to remoteproc_virtio
Date: Fri, 20 Sep 2024 17:16:51 +0800
Message-ID: <20240920091659.3933-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--4.256200-8.000000
X-TMASE-MatchedRID: XAa2d/45j8TxoFpSGnAM9UKcYi5Qw/RVMVx/3ZYby7+167wFD1iaKCMO
	uGtF4L1EbgqpvRqEHYk5Q3MXYJcEPa9VPpt+QVb+uHNkj91+t06y4iyjvVWToiz+5QCTrE/s+Vi
	hXqn9xLHBfR/WU+6YOHoyMsz8I0FQ1u8gqr2ks0XJ5W6OZe5hhSz3IJiNRHpLEB/Asc4oaYGbYz
	0jngQCJe7oid8NU9FAhiP008Dj4sgfE8yM4pjsDwtuKBGekqUpOlxBO2IcOBarhi1Jehn9vCTrR
	OMfzR3Se5e3W4VU1suoDdfoNQDR8uTW6GQajoDi1uSsQLBEGz0QKZBcLpl2MqeKDnSxteKciYxc
	+Xu5AWXBkGBTIlURuXoXDz8+lMxFpW+aIDJ4DaRzkxJ+SIkUjlAEm1wpw5h+lExlQIQeRG0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--4.256200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	EC54C13B8C08C7F17351EC38C392DE2B6C3BA37345CE0C8721E3E72B41C4F3142000:8
X-MTK: N

Add synchornize_cbs to rproc_virtio_config_ops and a
synchronize_vqs callback to the rproc_ops to ensure vqs'
state changes are visible in vring_interrupts when the vq is
broken or removed.

And when VIRTIO_HARDEN_NOTIFICATION is not set, call
rproc_virtio_synchronize_cbs directly in __rproc_virtio_del_vqs
before virtqueue is free to ensure that rproc_vq_interrupt is
aware of the virtqueue removal.

The synchronized_vqs is expected to be implemented in rproc
driver to ensure that all previous vring_interrupts are handled
before the vqs are marked as broken or removed.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 12 ++++++++++++
 include/linux/remoteproc.h             |  4 ++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index d3f39009b28e..e18258b69851 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -74,6 +74,14 @@ static bool rproc_virtio_notify(struct virtqueue *vq)
 	return true;
 }
 
+static void rproc_virtio_synchronize_cbs(struct virtio_device *vdev)
+{
+	struct rproc *rproc = vdev_to_rproc(vdev);
+
+	if (rproc->ops->synchronize_vqs)
+		rproc->ops->synchronize_vqs(rproc);
+}
+
 /**
  * rproc_vq_interrupt() - tell remoteproc that a virtqueue is interrupted
  * @rproc: handle to the remote processor
@@ -171,6 +179,9 @@ static void __rproc_virtio_del_vqs(struct virtio_device *vdev)
 	list_for_each_entry_safe(vq, n, &vdev->vqs, list) {
 		rvring = vq->priv;
 		rvring->vq = NULL;
+#ifndef CONFIG_VIRTIO_HARDEN_NOTIFICATION
+		rproc_virtio_synchronize_cbs(vdev);
+#endif
 		vring_del_virtqueue(vq);
 	}
 }
@@ -334,6 +345,7 @@ static const struct virtio_config_ops rproc_virtio_config_ops = {
 	.get_status	= rproc_virtio_get_status,
 	.get		= rproc_virtio_get,
 	.set		= rproc_virtio_set,
+	.synchronize_cbs = rproc_virtio_synchronize_cbs,
 };
 
 /*
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..73901678ac7d 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -381,6 +381,9 @@ enum rsc_handling_status {
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
  * @coredump:	  collect firmware dump after the subsystem is shutdown
+ * @synchronize_vqs:	optional callback to guarantee all memory operations
+ *			on the virtqueue before it are visible to the
+ *			rproc_vq_interrupt().
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
@@ -403,6 +406,7 @@ struct rproc_ops {
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
 	void (*coredump)(struct rproc *rproc);
+	void (*synchronize_vqs)(struct rproc *rproc);
 };
 
 /**
-- 
2.45.2

