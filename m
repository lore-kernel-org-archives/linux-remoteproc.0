Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E0B12F367
	for <linux-remoteproc@vger.kernel.org>; Mon, 26 Feb 2024 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708968772; cv=none; b=QHa4az9S4sAPiSOoIPat8rh24XLgFaCGmda+jW/MxXzYmbd5kesoYeOP80ngRU2ZPuOkXhHFbGqkw2w3SS1079ju0qvn49qo+fjydGxxf5jRqBOflRy8HJ51GX+4EyNRoiTZdxmO8F009KV3fK7jkMOT7+3sYk+jaG7B7fVSAg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708968772; c=relaxed/simple;
	bh=Wy4cGPpVerRovklUcPnMhjmK9LuSlF+TSnH28VA7whs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osMA34IvyqeC7dTcCE8RMfsVY74pwBdDQu9PszVwgOGpdWMYGbRVdE49e+KQ6WjzbODNOFPPJS3hPPS6vfA1MA/xVtxIMj3PutgtRV441WPibGNKQJr722uF8MBoBBsbbpMFCFWR3awZ7FKDaNUfiVfZiIU6E6hMQgcDqP//fDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Zv+jgdzp; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Zv+jgdzp"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-787b5c68253so235044385a.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 26 Feb 2024 09:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708968770; x=1709573570; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZotKd2o47/oKAtdV1I26QivtjRepugTGHOJDDp/ZM4g=;
        b=Zv+jgdzpv7kbxm6d51ljpzyYaHHHaw109ZABdcIgI2J3WR8hcr0j1EpNDHNYlqvDtt
         +7duKGpReSs2CDVHSgcR392oAEnvTVNOUE+fdszHIeuBjG76EGg/w0+GgqHv2MHX7ZKL
         B4WNuqWk5RAIPdGWp15zD/a9kubf6P4nkctjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968770; x=1709573570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZotKd2o47/oKAtdV1I26QivtjRepugTGHOJDDp/ZM4g=;
        b=E5iVGGlyMr5vFqaT+pGJOlsZSJhtOl7kTPICbzSgB7iOUAJ0rrdLF35YdcPyslIz6c
         f4u9lP9g0rOqJcFiso5GhbLR+fOhUkZTc6w+1YMmbKD6Tinl4F1yDphQigP4ZTsBpq4z
         tZYGbejRxR1z5j2pwU1RSLtDGX/Is/CkZ85EIZIXAQudt74LlbAOZgwSnmWLTcpoY4Aj
         ke3HL03Xfi19X0rJJ/lB6mbqmIvLF6tqJ23UMjnPZrEJtUhALYwWUCnS6Y+Q6VQFotKJ
         bbTP/NLPVnSHLnzMT5P+s8YWjYjGcB9+vcY12nZq0ftWclDUiRQEsgGzrQDWygM/9Etw
         TW+g==
X-Forwarded-Encrypted: i=1; AJvYcCWLndIa8G3ljfw5hdS9CXUPwTEVcQrdoiPfI7GHUPeVxoSi/qTgHQlLZqTCeH8ZuJhppKtBisxc8uTpxKth3MXNKVVmj0ub+vz1zx2KBXlifA==
X-Gm-Message-State: AOJu0YyI2rfzDemknZnnu9G+ii61s9Dc1/lYg+jPj77gi94NJVFFvwHn
	QwPG+Gx8F6IvNuibVIqas0HqQ6XC9wUd8mettlkFYUjIvZso88YMrUplOcp+ZA==
X-Google-Smtp-Source: AGHT+IH3rAwgd0NXJq8G/TBWJ93nsJy2+AmuJ1+7I538QjgTdtVQQDhSqF/spxCAW7zvWaoaCpSjOA==
X-Received: by 2002:a05:620a:9d7:b0:787:9a1c:fb32 with SMTP id y23-20020a05620a09d700b007879a1cfb32mr8021996qky.2.1708968769789;
        Mon, 26 Feb 2024 09:32:49 -0800 (PST)
Received: from denia.c.googlers.com (115.25.199.35.bc.googleusercontent.com. [35.199.25.115])
        by smtp.gmail.com with ESMTPSA id b11-20020a05620a04eb00b0078725d0345dsm2672669qkh.2.2024.02.26.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:32:49 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 Feb 2024 17:32:44 +0000
Subject: [PATCH v2 1/3] media: pci: sta2x11: Fix Wcast-function-type-strict
 warnings
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fix-clang-warnings-v2-1-fa1bc931d17e@chromium.org>
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
In-Reply-To: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

Building with LLVM=1 throws the following warning:
drivers/media/pci/sta2x11/sta2x11_vip.c:1057:6: warning: cast from 'irqreturn_t (*)(int, struct sta2x11_vip *)' (aka 'enum irqreturn (*)(int, struct sta2x11_vip *)') to 'irq_handler_t' (aka 'enum irqreturn (*)(int, void *)') converts to incompatible function type [-Wcast-function-type-strict]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/sta2x11/sta2x11_vip.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index e4cf9d63e926d..a6456673be3f6 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -757,7 +757,7 @@ static const struct video_device video_dev_template = {
 /**
  * vip_irq - interrupt routine
  * @irq: Number of interrupt ( not used, correct number is assumed )
- * @vip: local data structure containing all information
+ * @data: local data structure containing all information
  *
  * check for both frame interrupts set ( top and bottom ).
  * check FIFO overflow, but limit number of log messages after open.
@@ -767,8 +767,9 @@ static const struct video_device video_dev_template = {
  *
  * IRQ_HANDLED, interrupt done.
  */
-static irqreturn_t vip_irq(int irq, struct sta2x11_vip *vip)
+static irqreturn_t vip_irq(int irq, void *data)
 {
+	struct sta2x11_vip *vip = data;
 	unsigned int status;
 
 	status = reg_read(vip, DVP_ITS);

-- 
2.44.0.rc0.258.g7320e95886-goog

