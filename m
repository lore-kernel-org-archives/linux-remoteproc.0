Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DA83AB283;
	Mon,  8 Jun 2026 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.226.149.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780912553; cv=none; b=t19TGWkAg9m1wV2t8uWfcHZH88qGrjCu7NcSaF2J0F9D6yphqT5dDPgr4qqVo16qo3CX7UDGKkbv3oStr6hWClqalYeyBsLbojbwstJEBiJIe+M3z9bxVIFi80qAM2Hs/d1P9pXyuAS1vLqriUEiHP3k0nMNMtVHP2AttHk0cgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780912553; c=relaxed/simple;
	bh=T1UnwiheuMCQMo9Tor9HwQyYwt8qU9lr2zSyiC/fCjU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r7nh3AyvKbkXhfvFap7LZoaiAqjUlir4Czub+8t4ol1WKdM4IPzV1vNdZhPgNhBccmv4p58ME0lRP1YAi6IO1TBxT8Eups4iqiG0Ecgb0FsxuvgGwInSPIC6pl0JGCkQnJwgPBfN+VgjlZDFd4o3m7cKXzklcfbxnLtE1VBqH6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=runbox.com; dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b=Eu33mySv; arc=none smtp.client-ip=185.226.149.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runbox.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runbox.com header.i=@runbox.com header.b="Eu33mySv"
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWhu-00BrEK-5R; Mon, 08 Jun 2026 11:55:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=lCNv8SqXm3jLhFD/4mnTRkOAbQTUcEWzk89I3JpGeBQ=; b=Eu33my
	SvMmqpG6hN2tGXjBEh9lduS8bxMMaQX6AiU4p4bA2g7cOrEgwBWgYbvC51/rGaT1dlTkVI3g55Gu5
	Isq0vEaItYfKeL4gQv/wJdNkMv9bAjLUvi3fVPLVcRHd/bdmr5c1X96GBosLHQwMFHGNZq7gRA6EC
	RnYBYP2c3wBqyArfdpVRP0iTXc+FJ2FfqaC5TnDcHvfbldjZROl0yAHIMJQy6LRq15/wnatWbVceG
	ZhkQ9UA/kE7SQAw2Oznd7JyTRzyGErpdWKzTBUGRR+Ip1hw/7s5Hdkst/CRVrOttYk+uXbJ5t10Yj
	oVpW8Krmn76SYg5rlvcDNCohzUtg==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1wWWht-0000K8-It; Mon, 08 Jun 2026 11:55:45 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1wWWhm-00Ag6G-Ov;
	Mon, 08 Jun 2026 11:55:38 +0200
From: david.laight.linux@gmail.com
To: Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Arnd Bergmann <arnd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH next] drivers/rpmsg: Fix copy of channel->name into open request
Date: Mon,  8 Jun 2026 10:55:17 +0100
Message-Id: <20260608095523.2606-33-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: David Laight <david.laight.linux@gmail.com>

Nothing obvious ensures that the name is less than GLINK_CMD_OPEN (32)
bytes long. It is specified by the external caller.
The constant is only used in this function.

Truncate longer names to avoid smashing the stack.
zero-pad the copy to avoid sending stale stack bytes to the
remote system.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
This is one of a group of patches that remove potentially unbounded
strcpy() calls.

They are mostly replaced by strscpy() or, when strlen() has just been
called, with memcpy() (usually including the '\0').

Calls with copy string literals into arrays are left unchanged.
They are safe and easily detected as such.

The changes were made by getting the compiler to detect the calls and
then fixing the code by hand.

Note that all the changes are only compile tested.

Some Makefiles were changed to allow files to contain strcpy().
As well as 'difficult to fix' files, this included 'show' functions
as they really need to use sysfs_emit() or seq_printf().

All the patches are being sent individually to avoid very long cc lists.
Apologies for the terse commit messages and likely unexpected tags.
(There are about 100 patches in total.)

 drivers/rpmsg/qcom_glink_native.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
index 401a4ece0c97..d10abab6881e 100644
--- a/drivers/rpmsg/qcom_glink_native.c
+++ b/drivers/rpmsg/qcom_glink_native.c
@@ -481,8 +481,7 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
 				    struct glink_channel *channel)
 {
 	DEFINE_RAW_FLEX(struct glink_msg, req, data, GLINK_NAME_SIZE);
-	int name_len = strlen(channel->name) + 1;
-	int req_len = ALIGN(sizeof(*req) + name_len, 8);
+	int name_len, req_len;
 	int ret;
 	unsigned long flags;
 
@@ -498,14 +497,20 @@ static int qcom_glink_send_open_req(struct qcom_glink *glink,
 
 	channel->lcid = ret;
 
+	name_len = strscpy_pad(req->data, channel->name, GLINK_NAME_SIZE);
+	if (name_len < 0)
+		name_len = GLINK_NAME_SIZE;
+	else
+		name_len++;
+
 	req->cmd = cpu_to_le16(GLINK_CMD_OPEN);
 	req->param1 = cpu_to_le16(channel->lcid);
 	req->param2 = cpu_to_le32(name_len);
-	strcpy(req->data, channel->name);
 
 	trace_qcom_glink_cmd_open_tx(glink->label, channel->name,
 				     channel->lcid, channel->rcid);
 
+	req_len = ALIGN(sizeof(*req) + name_len, 8);
 	ret = qcom_glink_tx(glink, req, req_len, NULL, 0, true);
 	if (ret)
 		goto remove_idr;
-- 
2.39.5

