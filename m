Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37EE51BC09A
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Nov 2024 04:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039244; cv=none; b=jqtap9140nMrCSB7v7JWNT29SdNQofNFY5aOP2EuQGrLncPiYmAhWST+xREMStyRrpoPSBlsnRGME8/9fEqAyN+Bh0sVF8ojJ33T3nld78lw098p9SoftAd9wJcba4WgLaMC16tS5Ne5++9Tk7HUnTRqOvaZvQzOFcoN0tG7Kdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039244; c=relaxed/simple;
	bh=yU7WLijJlsijFQ3njIWiOdjlirhskFnp/8zUTNT2hJU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RHpQZp00HWkogCOW81Ng7q/C6VuE5/ztXQK0iFWKchsT8ooiV0X80SI+d2uhoOjcPbsyAAI33B8XHoDqexayeybEEyt6oJB7iX4spwuYgIyZjYes+8Q1FVpy4hlyekamKo8foLW2oBr3fi3gRaNsdiYTbJDOUZPK12VwOcY+YBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=sDCHDqKw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="sDCHDqKw"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-720d01caa66so1576552b3a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Nov 2024 20:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731039241; x=1731644041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tXIzFFbS3XTyrLL81wTyYFJyvk3RQi5nwZsMSVAUPp0=;
        b=sDCHDqKw5ih834Ds3AY76vVcpTTxKpp0cWvMJ/ZqM4uIuo+rX8QMIsaGfXkF4CD+vi
         HCrwjyKZQ2SAvfIC+/Eqs3shsjbphIYRGYMFX0VrddiIZ/dsA1Bc2cXYfiIomDQ+5EHV
         4A1FEAVIcFYC/7+zlkEWTzkc7Zlo5eRnrETJXo7u/g3wM/EUyr4JxW0Waj26bivp66+k
         NCn07dfFyykifyjgtdXONafZt4sSU+PbUxy/NSDjeS9GWIQusox185TIBkJL2iDP/baI
         N/ZLeWw0lPF1tyOZA6foi65tk25OBNvG+hMZpfZTC+nB0parGvOXK4ghE2FzjmTUcBRC
         gNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731039241; x=1731644041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tXIzFFbS3XTyrLL81wTyYFJyvk3RQi5nwZsMSVAUPp0=;
        b=qUBKNDQ709MxdpqOqmOjqSc8KimBk3CgWK8jxErxrGpc9j4DXt+GJpLNFXLttkacJx
         pG2EQfQKL028ytN+5kBoXqkcjGb66CEw3wzE4Cz9ckZbXIypsxX55wFd56OSPXDnQ/ef
         w9jt8yakvKPGCUC7ZZ04zC4hlmQAWVFAAERwbYADbDoDXD5Y5DAoUEhX8Z0R9+4hozmh
         tSQbvcsX9f+sn/6IeC8I1JWqItqZrZHJUzhZ4J73vmwwLNAeE0xCxUAi8WVJbBi36s4l
         FpnfvehTcdj/X9p2/IX+zShq/ZPHfA4L7SnW5BpnCJJou6eDrC570xEBudllbIgPQaIE
         D6gQ==
X-Gm-Message-State: AOJu0Yw9N28MrH2+yYuvN3xvE9mxcHZB7hzEwrJkzDs/0eAzZ6R1T9eD
	SCaCkPoXnpaSLeA7bxhRUFMauELnyZk8XsWdZUzzkHvRa8FuQp/vxIkp2PwJz64=
X-Google-Smtp-Source: AGHT+IEahKiRp+f5rteGGH81YJo/2dH8eLBeWHYIjoORNsP98ztbkHHpuu7Jv+zdPciU45zsd5SAxA==
X-Received: by 2002:a05:6a20:158c:b0:1db:da5e:361f with SMTP id adf61e73a8af0-1dc22a1b4d3mr2292481637.25.1731039241435;
        Thu, 07 Nov 2024 20:14:01 -0800 (PST)
Received: from localhost.localdomain (133-32-133-31.east.xps.vectant.ne.jp. [133.32.133.31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a541c95sm4964898a91.17.2024.11.07.20.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 20:14:00 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v3 0/3] Fix the error path of probe functions in
Date: Fri,  8 Nov 2024 13:13:52 +0900
Message-Id: <cover.1731038950.git.joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set fixes the error path of probe functions in
qcom_q6v5_{adsp,pas,wcss}.c by removnig subdevs and deinitializing
qcom_q6v5.

Changes since v2:
- Fix the error path of q6v5_wcss_probe() in qcom_q6v5_wcss.c

Changes since v1:
- Fix the error path of adsp_probe() in qcom_q6v5_adsp.c
- Add appropriate Fixes tags.

Joe Hattori (3):
  remoteproc: qcom: pas: Remove subdevs on the error path of
    adsp_probe()
  remoteproc: qcom: adsp: Remove subdevs on the error path of
    adsp_probe()
  remoteproc: qcom: wcss: Remove subdevs on the error path of
    q6v5_wcss_probe()

 drivers/remoteproc/qcom_q6v5_adsp.c | 11 +++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 20 +++++++++++++++-----
 drivers/remoteproc/qcom_q6v5_wcss.c | 19 +++++++++++++++++--
 3 files changed, 41 insertions(+), 9 deletions(-)

-- 
2.34.1

