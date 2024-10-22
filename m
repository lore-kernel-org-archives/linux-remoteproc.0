Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75D82038C9;
	Tue, 22 Oct 2024 21:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729632936; cv=none; b=WFUUe50PN27NiWAqGtH1+XNz3VAKdcjSBMWrQN2kGeu7PClHFOuNmVwuUGjLr2MxsEMyntadz6Q0OOJTiRZ03STfwbrKTxfLDHDWT3ElhJARmB2SdOXVh7nI5eUlfkdg+8WeiEap3WYNWD/WI6hLt/43agwRS/4j7c63RTXX/38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729632936; c=relaxed/simple;
	bh=khqAKUaBlTUcj257l5qQoN0wPr87NJmbqzaFVDfK9sQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UCT3JubyHp3vjsTaHHSfso96UTGCWOPvX/4m8cWYp+GLdtZqJ4qNFbaXTHycxtmjsGD3iXxSjNYvcZ608vTDw0ZtWw0vTYwOQSVPcfoStfS7f2Er2QizUd9GRhzsXyVN7TiSLhLbDXu/Nih1ep4SPRDq4QrW7Es8WrqxxV3/RB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLz+mVc/; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLz+mVc/"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2e2a97c2681so4463205a91.2;
        Tue, 22 Oct 2024 14:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729632934; x=1730237734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5VMbFcY6CEGa8mSQ8SIl+CmW5nmrRXjE9y4EUBsQZI=;
        b=RLz+mVc/wkmZi7TBEPNSkSCQ8KLoCsgXv5YpB91GMk+dTeDNvNlI2f7923q9kBVaUX
         ppFgW8bxYtxR+BF4nDcFJc/q/ysO3c/8TBKlhioUtQhILg0eIH/VNRsd21S55AwSoNOu
         GVjd/Ou6n59cqtp1TYh+anUTqctc3q9cqIuIz/epfTG9uQwHW8wBYaCvkCqlIbFgdrcc
         rnUEQA0VRqT6QWTA7vE11vV8Cm+qDLNuL9L+ynMM2whiyES1LYAPFoWjux5OIDthgoFl
         gukS8aivrY9ONGTZLUurl8leBc4ATnb9BmnRrix251AzpgCyjTP2DLw/2Z0Mx5bngjJ9
         JPjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729632934; x=1730237734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5VMbFcY6CEGa8mSQ8SIl+CmW5nmrRXjE9y4EUBsQZI=;
        b=tBsFUOAgU0l5sVNlNwa4XGmAYhLRj93xUw6hGcWznzbLtk6HBkLkTzJ1u+VeZ2AiLE
         g1LxFPgGz4hsV7A13cVaeKvy5yApG5bVfnnogeTehRqHn06KjmB3PuUV5Ul+8WQjnXFm
         PSQyn9f9JR/fAJ+go2IivIirghfG7znW0+MpyNFnng6N3f/GrrHV9LO+VGZdKTp/cUu5
         ETUvaUsol9K0V/Xt7em1ZFPtqRfjwKdLO2tED6IKcADhcP1FwKlXl4/HJCPnLTRAgKZB
         57YiHFgMyxfVm7L2Wz7XuuzPkm4jdFCIWgYdQ8f49Hv8OgsuZqyCbbzUYKr7LoFGcX7K
         U6Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVCkVmwjz1C70LaenA8dfYAQcNmZvJpwXL5YM+QL3u4SGYV9O929lm2Wxe7SGQcM2elKtiEe6hZ5to=@vger.kernel.org, AJvYcCWfWuALV6k8uJ8ii4hsHeIstLHUMKFjQbVbmjW1pZlpvSFgkS22awKpFgi/9s/qYk3LPXAZuaGjiBhMXZHO@vger.kernel.org
X-Gm-Message-State: AOJu0YzDr4uQ9jUiiBEA4sMlEaLRAqoy7zFNhl+JTFI2DohrZdOaB2JF
	72l1bEZfrCLtGtwhyotgFgTL0rHxTLtFmpnqUCoQigBVTuRBL5gy
X-Google-Smtp-Source: AGHT+IGoyJ44rXCIw1j5svtG4RuoSRt31SniDfJaYujZUOpfUUFYRHCYtHqX/vo+ifoh3XM2xD7Cmg==
X-Received: by 2002:a17:90a:68c8:b0:2d8:e3f3:fd66 with SMTP id 98e67ed59e1d1-2e76b727d1dmr363309a91.34.1729632934138;
        Tue, 22 Oct 2024 14:35:34 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed73fsm6726369a91.44.2024.10.22.14.35.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 14:35:33 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH 7/7] rpmsg: Documentation: update the path
Date: Tue, 22 Oct 2024 14:35:16 -0700
Message-Id: <20241022213516.1756-8-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241022213516.1756-1-yesanishhere@gmail.com>
References: <20241022213516.1756-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remoteproc documentation is moved from
text file to reStructuredText file.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/staging/rpmsg.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/staging/rpmsg.rst b/Documentation/staging/rpmsg.rst
index 1ce353cb232a..937cd2574584 100644
--- a/Documentation/staging/rpmsg.rst
+++ b/Documentation/staging/rpmsg.rst
@@ -5,7 +5,7 @@ Remote Processor Messaging (rpmsg) Framework
 .. note::
 
   This document describes the rpmsg bus and how to write rpmsg drivers.
-  To learn how to add rpmsg support for new platforms, check out remoteproc.txt
+  To learn how to add rpmsg support for new platforms, check out remoteproc
   (also a resident of Documentation/).
 
 Introduction
-- 
2.39.3 (Apple Git-146)

