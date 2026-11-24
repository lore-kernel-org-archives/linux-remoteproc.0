Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504490;
	b=NEj16lI1H2u7LgykGK0/ROMtIJrycAM4IMNhI4Xz+qU5I1n6EqdWvC0kQdT//uObRSB9
	 ySYUPwbSKVerwKf8McvpzpPcq/y3VXfLdJxYRrNvsmxGAo0CgBuXTq/cgvTfrdKfzlslQ
	 GuvfviM1+4XLob1h++CA4hHZsgdQpJhrqZvqe7ldyFSqycNnNynH+10tbQOHUEwuE3t+t
	 e5HXSl/OYsNTDLhOLQdbkdQibhi7+vIZmJTWk6vfP1mWwL5xzwcKN1eUzbaHh5Ydim38L
	 EqVQOYJ3YlwKxbs5X6NfSu77+2lVBO8ROrH64RCYYHJ8gfX51B08bRzNErPfXBXai/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504490;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=gSjTt3ALXyni33E6d0QmH2wWXxYQFnDYDl0AqS0EzrQ=;
	b=vtbAOuZpMBol5UW20A/FJU11UBrI1Iq7efDMI76LN2vALq97VqNlR9jbWGopk2EF1w9B
	 6r6kipif7cs5WijdaeIfxbZstkIQsZfO1Sh2IZXqQQSvMnxkxIzHuracauuPTFNgcya1N
	 6uZkXOUnl8ElA8vcjqPQ3ETcPm6+4/jZCgK1S2f1RmNLIMOm9EkzOUDtIikNvN8qSItVe
	 VopoFxOafmdBFowUetBwY5utzNLAITYDVbNrVVNWqfZgx4pb9F/EncvLfuCjRBSNXlxkT
	 6YoIU7FbGpYTI+VX5UZKwZ7lDNFM2243soRX1TE3X61nyrKh76RdUcxyjDnq170CvEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFv1uL6K;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E903606A32E
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 07:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E903606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dFv1uL6K
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso2102689a12.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 23:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504490; x=1796109290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSjTt3ALXyni33E6d0QmH2wWXxYQFnDYDl0AqS0EzrQ=;
        b=dFv1uL6Kn5kU0ADRz3uAUc8fd6w8aMe5iidaIcGh80lqez4E+FSnN0Ekwkxsfq288v
         dY7ko/Wlojyef1TTlXltGr4UVkYdjQcrIOL+xVq1Pl4miA5nV6SFBs4FD/2Ug/Las4om
         Shd27J/b8M7VGiKrmIvm6PMyt8YMss3JBVHxBFwts00Xjsr1kFGWmdU8m6eW7XxKKURV
         IrxrLSkI7jY0lMidUlmKd8QDREIAhYZTmvwk7IYV1/L/+AFyNxVEJxPnmkBBdfRmMy3v
         My+FduBaUSQ+D1Ri/psnEiAmPcSwrR5fsfxKbWd1NxWZhDi5nay8RTDkLCepHc9cEgcV
         OUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504490; x=1796109290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSjTt3ALXyni33E6d0QmH2wWXxYQFnDYDl0AqS0EzrQ=;
        b=VH1R8ETaq1tGcXicO3ufrP9WkwaeiFZqQ45HDxod2O3EAjhxSjf2UguT1CyfB0MXGf
         giFqY/oYJmZzHYtBcwgHQg4S78wyzutr4hO3gIobr/YPzgB98LMf9wsgUiaqyLpgwzjq
         x7UTZo+Lb+DNtbZ5hmQ4eaLypDVzHhZTQPwci7f94Y13g52wTYmZQfecw+JAOlc68bP2
         XsGTD1WaE2WENz+5jqxJAdDMhYaDdX13Z5+wkkShlh7TFsIezQMfw31d07pQKDjJ2wSc
         ePdV+Ao8hiHDgl34FtoHOZOkFd+k217GV025cwtdc6jk4iKrLi787oMP1dLwsRIc6B0/
         URkA==
X-Gm-Message-State: APuU4Z/dl++36kj6o2/gBF0Uad+4CWeFjAJx9pmdr2MO0JmFfHffsiSW
	awSnNR1E3c0qHFAzog0Acb0KMdEJ7fhKZMN9cN+bH8Ggj+NKUriMjDb7
X-Gm-Gg: AZFdTZdgV9v+JAgxWBjEpLNf38mEBlfd/W84dC4+hxdBchtEkYeMesvnWXiIwLl0lEY
	zxtTe11m2tNIfklnssGTEes+EgZL27GkFoQkTESjSglTh5GGrf4EWLL3kA/7O6LaBjzpqJcTIwo
	IGOrrd6GByZ6h+geVfiYarJGcQBiy6Dlspst+eo++lQ95+oIKkkXCc4yStfUi9ukNP8RSPD1IuJ
	oHka7cDJ6igarjf7qLKHqh7OF9H6+dw+jrRxFqU/aeVuVY2q7aWD3U1G0GvKymzGXNiSexMkbJy
	+iyqQ8klOvvFeclu1CpECmx1MqB+bOfz9phnRlUvTw7UO8SLOS+nfislYODz2WTp6xHCa5wRr25
	xnN050mmoi200/AX2dbJ2k+RNkqLdAPK9Zm0bKFxcZ2zPi5HKK/tQscMMUBGD9E2dxfnvj4ziDK
	9ku0giHcBLqdC4CEkAx1V9mqSd4tE0MEpcXBF2TNZPPxfT5VTgH0Nnz8DguBDli2/3tRtKTqppP
	AZWqCz/EJUPpM6mC4teZxLxt/uWgsEF6jM9rOhmr24DaFYUmHP+SKBG6yujuh+TPR7P4XKvJ/vg
	Qi8mNPB189DF9rV5W9CX/tcbqDgyw5EjdhRysMgAJYJW+jDP
X-Received: by 2002:a17:90b:2f8f:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b41c933eefmr12609949a91.35.1795504489447;
        Mon, 23 Nov 2026 23:14:49 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:49 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 2/4] remoteproc: core: Guard against a missing stop() in rproc_start()
Date: Tue, 24 Nov 2026 15:14:07 +0800
Message-Id: <20261124071409.972-3-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124071409.972-1-hyz3367@gmail.com>
References: <20261124071409.972-1-hyz3367@gmail.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the subdevice registration fails after a successful ops->start(),
rproc_start() unrolls with an unconditional ops->stop() call: an
implementation without stop() turns that error path into a NULL
dereference, and there is no other way to undo a start once the
processor is up.

Nothing rules that implementation out.  rproc_validate() checks the
callbacks against the state a processor registers in: start() for
an offline one, attach() for a detached one, which never look at
stop(); the only written rule, Documentation/staging/remoteproc.rst
("Every remoteproc implementation should at least provide the ->start
and ->stop handlers"), is a should the core does not enforce.  The
in-tree implementations all provide both, or neither when they only
attach (commit 1168af40b1ad ("remoteproc: k3-r5: Add support for
IPC-only mode for all R5Fs")), so none of them can reach the call
today.

Skip the rollback call when there is no stop(): with nothing to roll
the start back with, the processor stays running and the failure is
reported by the boot attempt itself.

Fixes: 7bdc9650f036 ("remoteproc: Introduce subdevices")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index b6fe74d34e5c..e44b45510b4e 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1310,7 +1310,10 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	if (ret) {
 		dev_err(dev, "failed to probe subdevices for %s: %d\n",
 			rproc->name, ret);
-		goto stop_rproc;
+		if (rproc->ops->stop)
+			goto stop_rproc;
+		dev_err(dev, "can't roll %s back: no stop()\n", rproc->name);
+		goto unprepare_subdevices;
 	}
 
 	rproc->state = RPROC_RUNNING;
-- 
2.34.1

