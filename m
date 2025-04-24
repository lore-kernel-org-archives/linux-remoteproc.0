Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9C2200B99;
	Thu, 24 Apr 2025 14:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745504899; cv=none; b=aX3h8WKk5o49aCPZ5F4742P9kckOZTMc9QNid5RzqJnAyrhYeThnd0Q1hJE4zXgrkOK8GpNKhnPJH3XYPtASU+HSQqEYXG4dHm9IYQ1wuKdWN6SQKRjk8K+wKJVMd1HHMxVCUX8X+9Fkf20Bb005EyQJaoSLSixrB1RoVnrs1t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745504899; c=relaxed/simple;
	bh=NGaIyrfLvZYm2Bbqj86f7XJVeWE52V6E339DRzSa20w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uIqjooosqI5ben/HtwQLUF+CIxijhVmRo0lqeI5IQT2z74MvSPHacIm5zDT6HYBGC2iV5eoCDPTgcHoH0wc8IWXKQBKQzc9ZQxY1mIoeYB0pFvxCZCkf3HuhxEyJTUJ8H2BzW+EKsKRziG6nXBCpVIj3nu6tHITWW+1eFF2Jw3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=L/UC+pje; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="L/UC+pje"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=SrpJl8aswLmDlKg/oEU55Eu7Y/A7GY9f/+w2KaZJniM=; b=L/UC+pje/sREJyfI
	q6lBcUKGG82DGMprJk9NT40T4Tn2plzANAq3qXrv8NKjJ16bW6t+1dDflhG7582s+2rYj1wmzTBnb
	cDghrFqGB3PKxI7rLquyqXf5iUIHPGR9gBRErbLVWGKim9o3i1o6c/4fKZojPQZMb3zH7omsKanLQ
	OVJcsvBwNZichmaUzi96bkXmhkjCnTIH/CKXyAiairMmXNZ+gSkRnXRzJs3f0vGt5uMFX1wG1Vgx5
	YaaV0JWuwx0RB2VPDDm/CoGMyJ0/5L+PThgMZaudtBWjHKzmbKLx2y/6rH89/uCB9rsTdMlFpcEH0
	72lXvkt/dZ3VKaE1yQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u7xYK-00DdIX-1t;
	Thu, 24 Apr 2025 14:27:48 +0000
From: linux@treblig.org
To: arnaud.pouliquen@foss.st.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 3/3] rpmsg: Remove unused method pointers *send_offchannel
Date: Thu, 24 Apr 2025 15:27:46 +0100
Message-ID: <20250424142746.79062-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424142746.79062-1-linux@treblig.org>
References: <20250424142746.79062-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

After the previous patch, there are no implementers of the
send_offchannel() and trysend_offchannel() methods.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/rpmsg/rpmsg_internal.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_internal.h b/drivers/rpmsg/rpmsg_internal.h
index 42c7007be1b5..397e4926bd02 100644
--- a/drivers/rpmsg/rpmsg_internal.h
+++ b/drivers/rpmsg/rpmsg_internal.h
@@ -50,10 +50,8 @@ struct rpmsg_device_ops {
  * @destroy_ept:	see @rpmsg_destroy_ept(), required
  * @send:		see @rpmsg_send(), required
  * @sendto:		see @rpmsg_sendto(), optional
- * @send_offchannel:	see @rpmsg_send_offchannel(), optional
  * @trysend:		see @rpmsg_trysend(), required
  * @trysendto:		see @rpmsg_trysendto(), optional
- * @trysend_offchannel:	see @rpmsg_trysend_offchannel(), optional
  * @poll:		see @rpmsg_poll(), optional
  * @set_flow_control:	see @rpmsg_set_flow_control(), optional
  * @get_mtu:		see @rpmsg_get_mtu(), optional
@@ -67,13 +65,9 @@ struct rpmsg_endpoint_ops {
 
 	int (*send)(struct rpmsg_endpoint *ept, void *data, int len);
 	int (*sendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
-	int (*send_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-				  void *data, int len);
 
 	int (*trysend)(struct rpmsg_endpoint *ept, void *data, int len);
 	int (*trysendto)(struct rpmsg_endpoint *ept, void *data, int len, u32 dst);
-	int (*trysend_offchannel)(struct rpmsg_endpoint *ept, u32 src, u32 dst,
-			     void *data, int len);
 	__poll_t (*poll)(struct rpmsg_endpoint *ept, struct file *filp,
 			     poll_table *wait);
 	int (*set_flow_control)(struct rpmsg_endpoint *ept, bool pause, u32 dst);
-- 
2.49.0

