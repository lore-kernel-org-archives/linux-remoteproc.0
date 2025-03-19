Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6B6253F0A;
	Wed, 19 Mar 2025 09:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742376672; cv=none; b=qBT5PG27z4zJhlMVOa+aYnDIoOe9bta1dsdnV9npbGa/2izhY0d/U6boQS5nfNQGlqlWekldogHQhSePe1kl6dDaG8TdtmhM1bCxiT+kJloSLTj10eIFrOsAMPoHhsWwh03cSvM0MhFuiVAyzaz+uSUDIRjzLRwLKHgZx2S0V5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742376672; c=relaxed/simple;
	bh=g816PyXJcj3PW9KR/oQmBslgPC6PMvYLghvAqSoQ0C8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EkKrq2TV/nUcOERrakenTcUpA1dzHFOk8DM5GXBFUBAFd7qOys30iqiNNREyoj7Rg5FAu2hjH3/1+58UAyrTzuumdj5gn/eSNsF+wss5M8fHF2Dw85Bwfno8tZmhH8Rq8/cXYn+bNSQs90GkepIWd97NaO7nB4Bx+GV1sIY9Bog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzYaUNqw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzYaUNqw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4FCC4CEEE;
	Wed, 19 Mar 2025 09:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376672;
	bh=g816PyXJcj3PW9KR/oQmBslgPC6PMvYLghvAqSoQ0C8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rzYaUNqw3yDUYu54/JcI1YvA3lI0bmnIH0PMyL3ifUWgBlhy5L5dEzoWuYcScymUx
	 5TF7j2HxS/3dRaKeu5MJZdYLOaP4AkUZ9a1TGHGvcGWsg/zXsDEffYIDHh/BSzqliD
	 Gd8TKQrd0WzU8DNgjXaBDfSVslr1L1lHMHw6bIawzMyB6//aMvz1SNxd1oRhXmoPN5
	 zsJfgJlHRTL8/GiKnYRhc7lkHRYD3iwrmFYZPCZ+zl1GcQBeM6Ztnb064vnfKUkssK
	 +nAkmQKRH5hYqh1RNaeixTR1t9zOVhcRBhSvWsmUy7Ljk2z80DHod/k5eFXvbl8+HS
	 wQLNkFeJWWhcQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 09/57] irqdomain: remoteproc: Switch to of_fwnode_handle()
Date: Wed, 19 Mar 2025 10:29:02 +0100
Message-ID: <20250319092951.37667-10-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
defined of_fwnode_handle(). The former is in the process of being
removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org
---
 drivers/remoteproc/pru_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
index 1656574b7317..4a4eb9c0b133 100644
--- a/drivers/remoteproc/pru_rproc.c
+++ b/drivers/remoteproc/pru_rproc.c
@@ -563,7 +563,7 @@ static int pru_handle_intrmap(struct rproc *rproc)
 		return -ENODEV;
 	}
 
-	fwspec.fwnode = of_node_to_fwnode(irq_parent);
+	fwspec.fwnode = of_fwnode_handle(irq_parent);
 	fwspec.param_count = 3;
 	for (i = 0; i < pru->evt_count; i++) {
 		fwspec.param[0] = rsc->pru_intc_map[i].event;
-- 
2.49.0

