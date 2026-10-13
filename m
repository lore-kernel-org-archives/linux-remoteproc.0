Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49DD3F4139
	for <linux-remoteproc@vger.kernel.org>; Tue, 13 Oct 2026 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871013; cv=none; b=bj6iwvDcsFI5rz+sdmZEfqLy2wGPGXtlIXf3DnWbWQsjhskCI0TJfXWKuIVtWQkVpRZdlpHsL0P5+36d8sRl2h8zm+kwX3OF3QAjXHat6x1PH38cLseI5ujpLHB7n4hXSEFJf1IC5zKPTf4tup8vpjWYhozBHDIfTEjreCqizf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871013; c=relaxed/simple;
	bh=3pCOcqKf7T9wJyZUmZLGcII0V6IWGjvH8jpDvckklck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PjPUBbluYK2CkvFG7Hb6MskLHh7reXfX0jgk3Am9p6GNV78vOJXSe7nhyc9hwtOyDIxsFExBp/vzrm9Mtf/pNt5VYRYUwwgJRfWpPXPsWKEirWHvqkyjMBl3wVF4yxvschs2iaVLJzc6Y/ShVkmMOhr66qv4X5kn5a6PaJZ2UII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSx6Be3d; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSx6Be3d"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1af482519so364365e9.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 12 Oct 2026 22:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871009; x=1792475809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=edPFNMluEF6s6sLCanSOFhEfk5IKgfxAjXociYy8RQU=;
        b=sSx6Be3d8rXaMlKRX3sy6Fa9oI+qKKmAUE/8C+bOSvCQ42dNOK/zcjgShIzu7j1rcV
         /jj5zxQRjXMS/3kPcgHG/G2QR4subIlihnIcY9LNQq1HTYF9q4EmTYVxsdqCQ1T85pXl
         Jyga9Lunvsd+qx4awFOipxkgG7Ml+VNaZEeX1DDrenDrSn3++FQ1/PFPQMcacNmRnRoV
         twfcvLB7sm31Ko5HyYb4utcjZm3wTtRNP3tX5JH2pScvzuG5yUGobcYT3uw71PHWuS5b
         RP/lgUl/6v8KaCn5H4hWkPQP3AcPAaxAhC4IyeckkpJwm+vzoXF3UwaHjLSAFiVWpsA6
         UO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871009; x=1792475809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edPFNMluEF6s6sLCanSOFhEfk5IKgfxAjXociYy8RQU=;
        b=by59BiiAC75/ODuXRHBDfvIs/Kce+yFtdYQb7adUU/CMhKSPaxht14y5uRrs+PljZp
         LR9rL/yCe7QSi5kst71AOfrNXxxQr5zpoEIT9CDfr86EpcFwA3o5308ERaxSY2B5YCN6
         JdAYwSvvN2Jh/nazuRll0icceny1QRp+OckuqMdZK/idnscKz/Xn9bYvVQ+XSCYt8t/N
         Z6cjtKwnmQC45tftmis2hm/eK0RG/OVy7qoT1AamCgxQmSd19L8nv6ITQIN89jOf54j+
         UBdQiDX83J7A0p5W2wpkNDqDK79NlETLOqgpaSScNertxmuCPIxGx1BJecWBd4yZ99hV
         4YXg==
X-Forwarded-Encrypted: i=1; AKwUvBzhJT/2Uf73fuzjv0RuVnV8hePvtZQVj3j+kgRh5T37RXbOpQgduud1ddE9A7o4VWw2t69Bxw5QUjIhOpYsOfEa@vger.kernel.org
X-Gm-Message-State: AFq9FYLTtnk70wqoKxoPN84sTxzAGCU90Ttr/tVwwtkDBlnfhyAxHEW8
	r2XsEJYDoQI9zUlGJ/STS5UOr5lxNzRz05UM6H6F7CQcPmW3sBHKmKDi
X-Gm-Gg: AYBFou09s8Ffkplgh2BCLwI9SjZknmnCplbL0XkE339Jl4rsPOx7chQqqoPNuage5bC
	Tsvy5R838IVIV6dKFLUdtU/vTGnxMbu1B5JKP8Usvr2918bgsyjVjHRAaVzltFSmKcd7bLaFn0t
	S8Cbo8PqQHNvemojm5oE3Rcq8Cg45afBHFqDT50ugOmzMuR04eE5fqrAsGkBQGRQQrN2Yn/vfKH
	K9UoChx39DgQGX4H2gUknI1hlw2TBPdzjiotV6Fu4NvCcxpyGpCXp5jG4i+1RMXUm7JALqTOZz8
	2idbt/Ywn/IcHIajOwa7zqqPzGhXDYtyiSEv8dAhDPUQinsdbQgiTJqBo9VIsxhyiuxJ4L98K8L
	pOP5WwowyQzQza8P5tNs/Y3BBLUIn4QOYg3NyMoc77EZq4N0PD/DOuztKxUJfnShr7cTJinDE9N
	V14UcPxuUybceydR+UA2LoV7G334GHqWKmSziBwvkuMT0lVbDMo0tHPyZOQP/+BVquw7JDMCvco
	Ng3DA==
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a18e49ad83mr221940565e9.11.1791871008947;
        Mon, 12 Oct 2026 22:56:48 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:ee4c:dd08:4e0b:2855])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6b3cbsm271369505e9.0.2026.10.12.22.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:56:47 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: qcom_smd: release channel OF node on device destruction
Date: Tue, 13 Oct 2026 08:56:42 +0300
Message-ID: <20261013055642.793161-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_smd_match_channel() returns a referenced OF child node,
which is stored in rpdev->dev.of_node. qcom_smd_release_device()
frees the device without dropping that reference, leaking it
when the channel device is released.

Release the OF node reference in the device release callback.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/qcom_smd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7dbe1c6efe41..6c1cb66528e7 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1065,6 +1065,7 @@ static void qcom_smd_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct qcom_smd_device *qsdev = to_smd_device(rpdev);
 
+	of_node_put(dev->of_node);
 	kfree(qsdev);
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

