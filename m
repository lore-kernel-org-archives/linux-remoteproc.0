Received: from mail.maurer.systems (maurer.systems [80.254.189.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD340211475
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jan 2025 16:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.254.189.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737562056; cv=none; b=EyWQ3N8Vp94d6u6JRwbNQw898tsAIJpHnZn/MiBOm1wiHSEXue49XL+2Y+iHCXiegboK6ZwqAse2rBHExAMrCxa8OsPw9xwqkqRV2ydOebUdNZvcZ4SeZUAMPAkPDVqIDhWim86SRWppqku9PFpWwoq3Trapm5bhWCq8xuFe8Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737562056; c=relaxed/simple;
	bh=A1sDKOSmcYxUHcWggoiN/i3djcrpcn26tRxiRSyjfR8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=QvbsrISrJQO/cGWOlUIMBovoJNY0cDhspO7fjEZsW+6fdZtCl0uj84UV4TVBey9+9I58jMQaGqbZurE2YgLAE5A++mPuB+768bIoq4msBidq4T6CsezLHwfI+FM1qFAV4faDg6AlUOPM7DxaQTO8zuhx6YKPjp8+G7DBBMhDtzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maurer.systems; spf=none smtp.mailfrom=maurer.systems; dkim=pass (2048-bit key) header.d=maurer.systems header.i=@maurer.systems header.b=aF2j0RnK; arc=none smtp.client-ip=80.254.189.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=maurer.systems
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=maurer.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maurer.systems header.i=@maurer.systems header.b="aF2j0RnK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=maurer.systems;
	s=2021; t=1737561557;
	bh=A1sDKOSmcYxUHcWggoiN/i3djcrpcn26tRxiRSyjfR8=;
	h=Date:From:Subject:To:From;
	b=aF2j0RnKGRh8O/39FnqyxILwfP3ln7NoSy9vACS7IkiA3GzGT7FN03gyc8RIXcp4A
	 MPoI69Et+gTsEp4rMsh0VCEK0hys+pho7YoGm94OMxUtEd7hb8EJ/hLbLGzm/jk532
	 k14I7Fr+48/1MCdOXxB5t272SkJUgsfvynSLTLJLns4oLmck2aajFFTUCqGI0tEjFb
	 JIGanOol5h7/iOFW7MLDgiQblyQthOvQp1PODDcdctlTxlc2LGEHXL00Xmi2jkj+6e
	 ggr41pXClNLJtnjlU3pK4+iHw6rLfQKf9H0VcGI+1H2wCH6dIgb3P5Tuv9VTPfJkMW
	 fQcloVGQWrHaA==
Received: from [192.168.91.174] (mob-194-230-147-126.cgn.sunrise.net [194.230.147.126])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by mail.maurer.systems (Postfix) with ESMTPSA id BBC4148112D
	for <linux-remoteproc@vger.kernel.org>; Wed, 22 Jan 2025 16:59:17 +0100 (CET)
Message-ID: <bc9f1dd8-92b1-4839-86c9-ac9e544648ec@maurer.systems>
Date: Wed, 22 Jan 2025 16:59:17 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Simon Maurer <mail@maurer.systems>
Subject: [PATCH] remoteproc: add optional hook for resource checking
To: linux-remoteproc@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

This optional hook gives the remoteproc driver the opportunity to check
the resource table after parsing and to replace the allocator in
the carveouts before resource allocation. This is needed for RemoteProc
over PCIe where the carveouts are already mapped by the driver.

Signed-off-by: Simon Maurer <mail@maurer.systems>
---
  drivers/remoteproc/remoteproc_core.c | 6 ++++++
  include/linux/remoteproc.h           | 3 +++
  2 files changed, 9 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_core.c 
b/drivers/remoteproc/remoteproc_core.c
index c2cf0d277729..3129c5d68770 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1423,6 +1423,12 @@ static int rproc_fw_boot(struct rproc *rproc, 
const struct firmware *fw)
  		goto clean_up_resources;
  	}

+	if (rproc->ops->check_rsc) {
+		ret = rproc->ops->check_rsc(rproc);
+		if (ret)
+			goto clean_up_resources;
+	}
+
  	/* Allocate carveout resources associated to rproc */
  	ret = rproc_alloc_registered_carveouts(rproc);
  	if (ret) {
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index b4795698d8c2..6d7d35d24dad 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -371,6 +371,8 @@ enum rsc_handling_status {
   * @handle_rsc:	optional platform hook to handle vendor resources. 
Should return
   *		RSC_HANDLED if resource was handled, RSC_IGNORED if not handled
   *		and a negative value on error
+ * @hcheck_rsc:	optional platform hook to check resources before 
allocation.
+ *		Should return 0 if resources are OK and a negative value on error
   * @find_loaded_rsc_table: find the loaded resource table from 
firmware image
   * @get_loaded_rsc_table: get resource table installed in memory
   *			  by external entity
@@ -394,6 +396,7 @@ struct rproc_ops {
  	int (*parse_fw)(struct rproc *rproc, const struct firmware *fw);
  	int (*handle_rsc)(struct rproc *rproc, u32 rsc_type, void *rsc,
  			  int offset, int avail);
+	int (*check_rsc)(struct rproc *rproc);
  	struct resource_table *(*find_loaded_rsc_table)(
  				struct rproc *rproc, const struct firmware *fw);
  	struct resource_table *(*get_loaded_rsc_table)(
-- 
2.46.0

