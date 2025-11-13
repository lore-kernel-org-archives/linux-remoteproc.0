Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80CC34404F
	for <linux-remoteproc@vger.kernel.org>; Thu, 13 Nov 2025 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763048381; cv=none; b=i7TcfW3I62U39RDQB1C9rTnuvKJul91SY/GCatfzW4ICXrZdjyqJUG4qryDtqJxu/TVY92xpbdXoAI3l21huFLHrgFHVUnPovnxVWXA5tODmqbI4tX29XbFmrxDSNnfJF49KnZgR583SoHqXii95h8ILseOIr8b2R7Izt0H0NwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763048381; c=relaxed/simple;
	bh=rPDGirdNX7egxsQQCFOPloEeBzb80gdFa4+7RU1D6gk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OJuMg3fI7N5omN0Rs6kyngEu+EIPQi9IxMLFyIhW1k6xwe2rr03iYIU9hyT/A+qpYVMXDI6yy/2Nd1TXXqOnjFQ4ubuzpXFYL+BNoLkXUpxCY7BsusO7nATltAJPekyVHAxSX58J4DzxCrdVT3V2AULku4V3uzEHfFAx9XjczXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=itzfM3rT; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="itzfM3rT"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763048377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VsSo0rHruUYZUSRInyxcyCIV2SApYNLgLqp/uhMcd54=;
	b=itzfM3rTNRenebQwm+O2xoQPz+w2sJQcLcsGGiKHPoOVKyLL8OmRZkNh6vzwqPlMyscxhq
	qBLToCimsI4idMU7ycNWx22mEjVyaQURtcy1qwfU+Hn13bfIOK1Ru+bODhjs+3LDP6axYU
	ueJTceI6ZYNGz8EwwMXykwDfwCQzEOU=
From: Dawei Li <dawei.li@linux.dev>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dawei.li@linux.dev,
	set_pte_at@outlook.com
Subject: [PATCH v3 0/3] Fix and rework of rpmsg_eptdev_add()
Date: Thu, 13 Nov 2025 23:39:06 +0800
Message-Id: <20251113153909.3789-1-dawei.li@linux.dev>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

This series fixes bug introduced by anonymous inode eptdev code and
rework the exception handing paths. 

And it tries to address a long suffering issue which may be backported
to stable kernels. 

Change for v3:
- Split it into 3 patches:
  1/3: Fix legacy bug.
  2/3: Fix new bug introduced by anonymous eptdev code.
  3/3: Rework error handling code.
Link to v2:
https://lore.kernel.org/all/20251112150108.49017-1-dawei.li@linux.dev/

Change for v2:
- Add put_device() when __rpmsg_eptdev_open() failed.
Link to v1:
https://lore.kernel.org/all/20251112142813.33708-1-dawei.li@linux.dev/

Dawei Li (3):
  rpmsg: char: Remove put_device() in rpmsg_eptdev_add()
  rpmsg: char: Fix UAF and memory leak in
    rpmsg_anonymous_eptdev_create()
  rpmsg: char: Rework exception handling of rpmsg_eptdev_add()

 drivers/rpmsg/rpmsg_char.c | 61 +++++++++++++++++++++-----------------
 1 file changed, 34 insertions(+), 27 deletions(-)

-- 
2.25.1

