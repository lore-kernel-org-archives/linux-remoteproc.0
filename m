Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E523EA967;
	Fri, 11 Sep 2026 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106970; cv=none; b=FmUOvyaDXM1/U1XPve9yYvtRQJfReqn1Uo+8BhlA/4D1zxrWTqYDz4jV2hpw2QKJ9coyo9+ob8VmMA7kvq8BEsvFXcp8JA+jJbuAO0CVNbo0L9GgM2HphyMFC4o78IH5EQOxyS9IFGEsxVCjO8lQ2xhvU139rcHh+GCYTp+jjsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106970; c=relaxed/simple;
	bh=YUdpZszFTWkioRDlRd3pCO6922f+pcUGEYSKqXwb+nI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DRhbpBvD+2H6FvWDXYtiyJLEbCWQ1IlMGH8kY02kDJwpOECmh4qgQZlEC7kFgzGvYTtgfCsgSdwVYpR22Hp2QaK9AwQ7DD3QZKhQbnjo4lo3hR59+u/4HhWEtYUlY36/lb2SrOoJFu9w2mI2R54Afn4rrmT9x6zuftSCmuGK5G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=CrtOijhS; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="CrtOijhS"
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fb6;
	Fri, 11 Sep 2026 14:09:21 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] rpmsg: qcom_smd: reject interrupted channel waits
Date: Fri, 11 Sep 2026 14:09:20 +0800
Message-Id: <20260911060920.94363-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15bb3203a1kunmd78637c71c734c
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSB0dVh5PSBkYQhpCHhkaGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=CrtOijhSBdA4a4uscJHjWW0tH1RyFtavJLQWiGfhWsIKkMo1joWopIZHiZOi4v4n9Uvi1eAxQffenfdV7A+PwT2x+edpSRV9/DoQDidRVLegaw7/4daTjbyzjdG6EBIm6cDEi1W6uJoaJ1CuPd7UW/Fv9XeYk+ujcypPuTRQNm4=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=Dza5ixR1woqehY7UwxEtCkc1+9nTff5+Lpetly829Mg=;
	h=date:mime-version:subject:message-id:from;

qcom_smd_create_ept() waits for a channel using
wait_event_interruptible_timeout(). If a signal interrupts the wait
before the named channel appears, the wait returns -ERESTARTSYS and
channel is still NULL. The current zero-only test treats the negative
return as success and then dereferences channel->state.

Require a positive wait result before using the channel. Return NULL for
interruption as for a timeout, following the endpoint creation API's
existing failure convention. No endpoint or channel resources have been
acquired at this point, and the successful wait path is unchanged.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/rpmsg/qcom_smd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7dbe1c6efe41..7bbd29707f78 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -914,7 +914,7 @@ static struct rpmsg_endpoint *qcom_smd_create_ept(struct rpmsg_device *rpdev,
 	ret = wait_event_interruptible_timeout(edge->new_channel_event,
 			(channel = qcom_smd_find_channel(edge, name)) != NULL,
 			HZ);
-	if (!ret)
+	if (ret <= 0)
 		return NULL;
 
 	if (channel->state != SMD_CHANNEL_CLOSED) {
