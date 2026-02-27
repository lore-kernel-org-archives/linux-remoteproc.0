Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0019530DEB6
	for <linux-remoteproc@vger.kernel.org>; Fri, 27 Feb 2026 09:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184180; cv=none; b=TQVE3sgORuYF4i1T+nznAYA4hzdZld3Nm6dXy4TIdCTbMvavikVBD0l7lvkB/l4XQ/CFVWu9qnjCdB/nnPGY0oChWHM2Lzlp1R1QjkdFCdkj3Z6VWl1Zvq+5x9+VXPeDL1h1fvqwRrIONL4JXavuki3F7MG24Dw8i2+FzfplgZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184180; c=relaxed/simple;
	bh=ITVBlhXgDK5awfl3qNi6hfrHAMCUcYOb4u2a9HAsAGU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TlAOdHwpLrfipPD4nqzY78ruAFKKQub96oTHVhoR1DSuSaot5GcojnyQ4qTcAfee0h1lVa9mldzgZ0TaqRGp2w4jIC65KZ4eTkudo9tsS5foa+QSHVH54HyOyPSTRvWJglI6I4fX7nKvdHeijoXWhzRmPIgKE9dzUgCAtGwud9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACXPWlwYqFpy5nTCA--.2013S2;
	Fri, 27 Feb 2026 17:22:56 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: robh@kernel.org,
	linux-remoteproc@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] remoteproc: k3: Fix NULL vs IS_ERR() bug in k3_reserved_mem_init()
Date: Fri, 27 Feb 2026 17:21:10 +0800
Message-Id: <20260227092110.4044313-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXPWlwYqFpy5nTCA--.2013S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZr4DKw4kWFW5tr15uw15urg_yoWDCrX_CF
	y0yr4fXr4kJFy5C3ZIva1ayaySyr9Y9Fn5W3WrtanxJ3y3Xr47tryUXF4DZry7W39Igr9x
	Gr9rJr4j9r1DCjkaLaAFLSUrUUUU1b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02
	F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4I
	kC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF
	7I0En4kS14v26r126r1DMxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUnL0OUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

The devm_ioremap_resource_wc() function never returns NULL, it returns
error pointers.  Update the error checking to match.

Fixes: 67a7bc7f0358 ("remoteproc: Use of_reserved_mem_region_* functions for "memory-region"")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/remoteproc/ti_k3_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/ti_k3_common.c b/drivers/remoteproc/ti_k3_common.c
index 32aa954dc5be..3cb8ae5d72f6 100644
--- a/drivers/remoteproc/ti_k3_common.c
+++ b/drivers/remoteproc/ti_k3_common.c
@@ -513,7 +513,7 @@ int k3_reserved_mem_init(struct k3_rproc *kproc)
 		kproc->rmem[i].dev_addr = (u32)res.start;
 		kproc->rmem[i].size = resource_size(&res);
 		kproc->rmem[i].cpu_addr = devm_ioremap_resource_wc(dev, &res);
-		if (!kproc->rmem[i].cpu_addr) {
+		if (IS_ERR(kproc->rmem[i].cpu_addr)) {
 			dev_err(dev, "failed to map reserved memory#%d at %pR\n",
 				i + 1, &res);
 			return -ENOMEM;
-- 
2.25.1

