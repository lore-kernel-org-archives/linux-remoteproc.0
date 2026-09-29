Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0033AFAE2
	for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 07:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790668509; cv=none; b=lyUR7K7HbQ8P/4KJ3gJU7hyaSuK+f4+SQCAIcv05yCUvO5vTPAPntMG8ZyrfcvwIBGdfk0wT0UymegATZS83NjrKjBxsOdpmW7Fl0RfYoYjzfYrcQu2N2LHTwBGWcXwxY0zZUDpSQVvddBd80rwXxsj6/98BVzlkXrEidyF/NgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790668509; c=relaxed/simple;
	bh=qn7wtcfgDw/6beT448h0KJEg9pz+lSdTAFzpYAW/PFE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RlApKaU/Vd6AUXQfFYfGkp9Gsvb6nOqsJ70+5/GFHnXBsCVZuHwUgZI3AxJEPCZnzsiH6Onh7ugxRIc80QlR0WHYialuBcQc3BZBoX+mfk6v0/XgJrlB9NuXb8JTluWXPZQxQlP8qlr/IcaXnVUzQ+p9/aPByxfa3XO26OP8src=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H10cLDnY; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H10cLDnY"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-882f2861859so575311b3a.0
        for <linux-remoteproc@vger.kernel.org>; Tue, 29 Sep 2026 00:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668507; x=1791273307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8pfy9hR5slGa9UAqwLWXi7fOEG2lvxFxA+B3Iz6PFlw=;
        b=H10cLDnYsvWuF70iR+Qt5oNua62dkuwuO0tIX50dUItHNtbwIBIzqIIyRu0wZKeeyt
         CO0rNl4qecczJHmqMPJcjSQMDS7DWiadwfTQwSAaWWQFxwYir+P0jGjmuO5XSrbY2+Ya
         2G3Vc5c7B3EtBwtMdX/6YhbdEQkvetK5OPkQNcCy0Dqe5C+w/fkH98Ljkm9nfsCSJvG1
         nIup+snR7A0mhUMQYKgead2aVKhrHiWU0mHLi1i7Sm1tY7UV4sUC1/p7kxzFs+6Br3sX
         hzomTY7bS/4/Z9qN9jecAXOE4MZXsVw0lOED+5KPjMNaR2dIXAZ2O9RguyvpkaBC2icf
         P2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668507; x=1791273307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8pfy9hR5slGa9UAqwLWXi7fOEG2lvxFxA+B3Iz6PFlw=;
        b=U+mRMmE25NVOVeg9z/fjYX/kdROCKJNMiZSMJ5GOXGpUWWB9XGL91KA3Ww3rgFAFQY
         t5VVn7EUN5UBGRWMDCvZhCLyZzgHuxp4Ca8MKQmBbUyU3JgNiMJDha/GP2GuRbEbirK9
         BSlXhT0mKZl55eyie3XQfOGOU9h0CJql2Kr04oiJdinFbgDdtpMbBE6PoYyt62509mqf
         oyqzSQuOCBnc5y5zjkAfJavej65qrtsVica/s2pH26CCCHlaNUrH6Dt1Zc3NA7bG/xqf
         AwmnxORTvVl0VlkbxvFIqTqhcIxXR1E4CPXgZdeY1kbngsFBtm8nkMEwqaeqVCvCuv4o
         xydw==
X-Gm-Message-State: AFuF++mh5HeBnXcCaASwURHd9WZU1+LJnLa1eVQBZ0fsu7E/AsdGDpvD
	VsFlntENK2VIOtmXlhZ4G9f4bXJhWYPoPZv8WFkUYa43rzIWek0MG8Io
X-Gm-Gg: AYBFou31sgqrGKhyXueMFMX0saPlyCXj2dY7uPtEYQCjwhFQ9Pchl+Ar1p7STGNdw8N
	+htdXr5zfTul0kKFlGyORgWJM/v+BlnjgxqGa8czuaNWw48tAQvZFMmKV5ur18HmF/BU6MnMCER
	hTqWorME5htlj6gyelg9LUZ/MRS4rViIdto3F2TfeIkb02fgiJD2GzzFucmp+dttj6hURsGS6B2
	gLz9l0WXLilxlCy7HdwpfX38oWD9NoipnYTsOKLt5ohNReqVEfENNVFvdUgsb48gvoGnKKLNfHc
	DO6CDXASv7k97R0IxQwWEY2h3RmMavbSvqT44Azqxiz2yPFfJwTHiR9VXSJL954SO62E1Q5lhRp
	3GKlJ9WJQiNjrhtg+wwQ4XoWs7TdU53ZucSPhv/N2l/5ygI4KMjFPcQjq8wowKABQzkjYZqnZHh
	uNCQjts6CsTwpYeSzYcJlIHhH+GGdez5bbWwbdbwbgVC1U21CtDaf8oQDoZ93IgATIlb/KqgsQZ
	VWr/MKEdq4VUulRJjs=
X-Received: by 2002:a05:6a20:4308:b0:3de:3ed1:48e2 with SMTP id adf61e73a8af0-3de7ca70908mr1405251637.2.1790668507391;
        Tue, 29 Sep 2026 00:55:07 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.12.106.39])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885e22ee338sm351772b3a.45.2026.09.29.00.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:55:07 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH 2/4] remoteproc: core: Guard against a missing stop() in rproc_start()
Date: Tue, 29 Sep 2026 15:54:51 +0800
Message-Id: <20260929075453.2324597-3-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929075453.2324597-1-hyz3367@gmail.com>
References: <20260929075453.2324597-1-hyz3367@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
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
index 123aadb467a0..19e0ea3e7240 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1336,7 +1336,10 @@ static int rproc_start(struct rproc *rproc, const struct firmware *fw)
 	return 0;
 
 stop_rproc:
-	rproc->ops->stop(rproc);
+	if (rproc->ops->stop)
+		rproc->ops->stop(rproc);
+	else
+		dev_err(dev, "can't roll %s back: no stop()\n", rproc->name);
 unprepare_subdevices:
 	rproc_unprepare_subdevices(rproc);
 reset_table_ptr:
-- 
2.34.1

