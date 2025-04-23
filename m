Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D89428DEEB;
	Wed, 23 Apr 2025 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745423528; cv=none; b=SAYsRKTYNlJVZpLOtWUgxLIMiDg4uQ/E65myzqktK4GtNCXx7JDwXawlSWwlX5VlugPgCyZyNeXWFgzCJzQWy8XFxcvMYAvB8ZnwKxjGkimgwjlcIH3i2MzeWqDHOqiXPFZokgXp5F9sLr9yyc31QiROQb14KaIYdGg275eH55k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745423528; c=relaxed/simple;
	bh=xyjs0rLrd34P5DK/m9PmTC/jCEqBM3B50Jzi+NTDjBM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZXeVdXQQte9yYxT5p9mA7qGWoenUbLtBMinY09L1ftPVvWJj1nmQ3YdOT915btd/4tn4i8xxQ+rIla7SwYax1bj3lkwsnIAD2vSjG027siY3Y2suC9iox1ZBKiUkxHTAMDMs1rmrV4mBcyxjEe6NN/WljS/9MideIeT4jYnrVXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR5mNZxJ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR5mNZxJ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af6a315b491so5827774a12.1;
        Wed, 23 Apr 2025 08:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745423525; x=1746028325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zSN8LA1qXE8sSMrIXXGWvP/A1XS/xD/J162Xg5jQH2M=;
        b=cR5mNZxJVs+4hEauiKYGnHCKfyrTgvxBfDOWsYJ09GGncQsGXIKWKDbMmQRV4eC6xO
         v+DujIKSWN5IADKgfEkcOlq+IBzMQDMhcs5kuuQqkR0Zlr1LZygCLGCIWgxKck20E2dJ
         JhsrznWPTbOXUTZMXkWaY3hyDA/6z0NULE+npcx8Jfr04HsVW/6dgNZIo9MSNYhgLwOv
         MoXm2NaS/hUyVv/BmyTGUTU8/puE21M+1a8pFpTA/RNShrKIUJfE55Z8N3auJ9N/gfKg
         IX7MU3yFeQlFHG4mCgEXFtvJrIfXQbbtTkSOZHM+LXmaB8HTfwFjFYR8Qom0FOnqto6/
         QDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745423525; x=1746028325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zSN8LA1qXE8sSMrIXXGWvP/A1XS/xD/J162Xg5jQH2M=;
        b=pmbRytLk8HTFMqSah1TcFA0rzwziuvXSQ2QRm4bNym2KNKf61lahQNJfKqiwCveIHf
         UHlcWylg6sAjFkFxxBaWU4TOssaNWDdIjfxZDq/UqLT3FPN3976zglS+AZ22+q1l2nRk
         G6UyG1Kbk2K138sE72GqE5D6XvQDVSo+owDAUZPTCFZPMenGhyRrkDcn0AKVfzasQbiE
         tMOxakGQBwUbzyv4KxE1gP+B53r727B69xMfah7jfuw6qS2uDDm+vaKuKeKf0qjSv4ls
         T7I782X5uj8Rykat1/DoSZRqhH3LNYSO2jAa4EKJe9Q8tMN+XNl8ZlZ/qfYk9uDSC6vb
         Dt4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLMUqRKjJ5QkfeWvCz6W3j1FWYN1oGwR9z1gCSKOOc7Hd+cCwfyQuAyT65haF3TDEa4rpAzPxva0Udr+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLK5Wx4bfFvgtjqgOwfVoLg+jD2m8U4R4qxjOtmFzBSvJWm/NA
	B5CqJ7w9q6q82GRzYPopowmVhTkJIrQQCaEc0XdMWR1sMxYYzZ+SjL0dkgUTNPE=
X-Gm-Gg: ASbGncvNCXcajbPWxsHKo5ClAy7Ss+7ET7Gd4fcuBvfeHoZdHh0Ox+64nZHG7J81o6i
	0m8qqTkmzsGpff7kOnGO08GZXh5bbv8rs+Ki6/QpR2MtIzcXranUuEcb2+tAqGHsWa00FzChQG5
	njlNvBs4/dDlUorknl33mIBtMhDw1DumeMOEuZEuHZ8Lf91Ma5mP8lLgVnd9SEtQipVTb6OgnsJ
	Mm6vgiAW5SspdVy4/ZaTUwaAi038qh3kb15KTwAIHwxj4iwl4Cbjvvf6pPHXzSdCqhl65JdIUf6
	AzouA2bzV4drS8JdJu3bhAnCsQ2bxjO7Pzcszp9VNaqdjzmOOBoc66o7urffyx8=
X-Google-Smtp-Source: AGHT+IH9NXu1Zh4il4mX+tmqFO/fGM0azr6O1PCj5OfemeTOeltYbazHILrLFl2ZpdVQAwyq5Vkrfg==
X-Received: by 2002:a05:6a20:12cd:b0:1f5:92ac:d6b7 with SMTP id adf61e73a8af0-203cbc05557mr29541583637.4.1745423525288;
        Wed, 23 Apr 2025 08:52:05 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c0228sm10598640b3a.25.2025.04.23.08.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 08:52:04 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH] remoteproc: imx_rproc: replace devm_clk_get() with devm_clk_get_optional()
Date: Wed, 23 Apr 2025 12:51:31 -0300
Message-Id: <20250423155131.101473-1-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

The "clocks" device tree property is not mandatory, and if not provided
Linux will shut down the remote processor power domain during boot if it
is not present, even if it is running (e.g. it was started by U-Boot's
bootaux command).

Use the optional devm_clk_get instead.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 drivers/remoteproc/imx_rproc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
index 74299af1d7f1..45b5b23980ec 100644
--- a/drivers/remoteproc/imx_rproc.c
+++ b/drivers/remoteproc/imx_rproc.c
@@ -1033,7 +1033,7 @@ static int imx_rproc_clk_enable(struct imx_rproc *priv)
 	if (dcfg->method == IMX_RPROC_NONE)
 		return 0;
 
-	priv->clk = devm_clk_get(dev, NULL);
+	priv->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(priv->clk)) {
 		dev_err(dev, "Failed to get clock\n");
 		return PTR_ERR(priv->clk);
-- 
2.39.5

