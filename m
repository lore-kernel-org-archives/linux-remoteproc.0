Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721602222A3;
	Tue, 29 Apr 2025 23:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970385; cv=none; b=EIIXt0BRKys5r76nqDR7s6/xOhAXB2NOnoKWfiLtcRJzEPKhtmfXLmxYGWVXdzg9Exclz7U/AQ11+NnDO27QgTCtty7624Z2meEuZ3dAW7pu8BTX4q/E2drsouzmVsp0N8Xj3uLVmCLGYb/WUHOXxZkYd2CtrNV2A21dxL+aRbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970385; c=relaxed/simple;
	bh=NGaIyrfLvZYm2Bbqj86f7XJVeWE52V6E339DRzSa20w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dMamOO3THuqS57cb3v/RfGgha+owjk7uYfqcwlH+9kpN3rB1P4SaS7U4A5Sj2uD3cZQ2N4jdIrboUJk9xSil5LcKFxmYmiK3Ovqcj/wTkox421TI9ayBdQA+Qpk1L0G4OGHzsk/k9R8Znkg1ueV8vYzVNGT5+KY0r2qumzmcovU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=jtfFETES; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="jtfFETES"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=SrpJl8aswLmDlKg/oEU55Eu7Y/A7GY9f/+w2KaZJniM=; b=jtfFETESGjVlJ+3P
	ztmtGff/8bCt5BaU0drQID5thdVjuAF/Y8r0L1WeeeBB5+h+0xiq8yeI9zAVKszMsmHF23Gy0r2IH
	sYcJV371+suYiJucgwfrAzf1ioqHIiGnCdd+KcLgkrv/hkKkxRHKcInwamBHB8IpCJiz/J5+jPpWr
	sZfaOlYPPCJaGjbiEVHHktkFxRnETaOsOvEIPDvFxD3nNjW7fvnrP/uPHfWlYQK/ipaObId7LXYBc
	J8yA77KRfYjRpuaWe3HH04O+Dk7BZIOo0kR11phwAsucDJZ/k87qCrokLBZLZ13j1I+Rn3iHs40/6
	QgN+iczIc1EO++J9JQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u9ueQ-000WFz-2H;
	Tue, 29 Apr 2025 23:46:10 +0000
From: linux@treblig.org
To: arnaud.pouliquen@foss.st.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v3 3/3] rpmsg: Remove unused method pointers *send_offchannel
Date: Wed, 30 Apr 2025 00:45:59 +0100
Message-ID: <20250429234600.301083-4-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429234600.301083-1-linux@treblig.org>
References: <20250429234600.301083-1-linux@treblig.org>
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

