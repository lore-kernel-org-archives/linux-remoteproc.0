Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A018114012
	for <linux-remoteproc@vger.kernel.org>; Fri,  8 Nov 2024 03:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731037373; cv=none; b=IOdULwjr/SVMy9v/ZlvI8xNjNayfa79QKzUTdtQSbMkFILHsVaBWB3CqqdKXeT9ohDk380jOnQ4NjrbTvYiTBISDFbZ2JhNmlLEPn0uPwHKhykRMqFyOa9IM2xcdAYWmLxP+JJfoBgYN/OLCEC1zHYGmQHWJMfJHDd1wrE3jsWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731037373; c=relaxed/simple;
	bh=sopiOlUZEJTEiDlTbDU7SN2eKYI78wfXYCTa1I2AttY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ap0rv0/gW561mMh2ev1Aurgdl27YFcsTJFEBD7oYLiuasEkN3ZoSTdHkc2YmTY4tz0q1mWh2PIfWLV6bc7V/UINtM1Z66l6NEY/KGrTUFh3lx+3bxi7XpFMnGYLyU1AvQSJzgGGntIR5sO+kslQyhca6JPFn9VAwk/4azv2xGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=spYJqqFj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="spYJqqFj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cf3e36a76so18214845ad.0
        for <linux-remoteproc@vger.kernel.org>; Thu, 07 Nov 2024 19:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1731037371; x=1731642171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qGm51aiWFfmYogpgbOpHwSneOPQaUZRc/YhOAy7K4a4=;
        b=spYJqqFjEx9b/DS11mUezCdNI7+1RDZzRmVZ2cY5ipfrcVnIQDYi2C0zhCtHMCgDJ6
         1zB98NozH1tHHJhQ5N9RFVF6ZtedkzGQVaCu21EjVaZufxSSkqs+e8yk8z0eiGkEzr9Y
         rH3fqmgeC4Dg2kuw5FHTUxJHtgZ1EoIL7YC3cNfCD116eQxy7grLBmDH67GkLlIhzA3Y
         r3ogcIw2AnUySEAz7Thvq5AIGwUUv9vYZ2L91dp4vHi3qcJay6v4+sqWChPlYGX99w3B
         W0y9aeZzz2fNtLMprT3AJMKjVvU+hY/je5PLYFVKKq245J/N3E6jA8L5UJbBIc9GpANK
         naaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731037371; x=1731642171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qGm51aiWFfmYogpgbOpHwSneOPQaUZRc/YhOAy7K4a4=;
        b=Ktl4XQxnvQbT7ZPhNrwWyHNZciscSnNRTAIA0mxT8K0DhLi6BkSpGu5rZbIfTAJRRC
         woD7RzefCRVh9iPVkr7UfTcW4kfbXfCoQyLK+YBjtdaLBmWhs86vTzTm5u0dyeIq3iuH
         H1ACVaba6bDaVtT23hqGUVJKoOlxlEfUOHRWkHfEBfPCEkWX+pwImzk26AbyfIANRuzM
         Ujmrm0xfSWYYMJwCh7faUTrRbLqIGNECwDkQOzlvxXCwWe5i2KEUCdCATGpLC9S1k5UW
         JHRzWivKHIlQtm+JAVWrj5cXIBENcMN32eqIsjsuxwfr8+sGwh2UHWn6Dai1m0bL4fJL
         YNuw==
X-Gm-Message-State: AOJu0YyP9c6gYguGWkpJc8uHxHmeR+/iynRqb7t/ner2JZWeFctg8hK7
	0b33/rILamg3M2Q9B1/2F95AokVFu2ovdFaLixPKgsC2cMlvcuFxlMb7nnHBfwoGMOivswIk2XV
	D
X-Google-Smtp-Source: AGHT+IHa3YM66I28yX2WKWjqFxmsf/zCsGsw2d89QzLZe6VrLEB3rL1gkmuwlE0N+8rHB3ehAkT0tA==
X-Received: by 2002:a17:90b:2642:b0:2d3:ca3f:7f2a with SMTP id 98e67ed59e1d1-2e9b16c9138mr2491775a91.22.1731037370854;
        Thu, 07 Nov 2024 19:42:50 -0800 (PST)
Received: from localhost.localdomain ([2001:f70:2520:9500:1163:1c51:917:b853])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e9a5f5e57fsm2439821a91.14.2024.11.07.19.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 19:42:49 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH v2 0/2] Fix the error path of probe functions in
Date: Fri,  8 Nov 2024 12:42:40 +0900
Message-Id: <cover.1731036523.git.joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set fixes the error path of adsp_probe() in qcom_q6v5_adsp.c
and qcom_q6v5_pas.c by removnig subdevs and deinitializing qcom_q6v5.

Changes since v1:
- Fix the error path of adsp_probe() in qcom_q6v5_adsp.c
- Add appropriate Fixes tags.

Joe Hattori (2):
  remoteproc: qcom: pas: Remove subdevs on the error path of
    adsp_probe()
  remoteproc: qcom: adsp: Remove subdevs on the error path of
    adsp_probe()

 drivers/remoteproc/qcom_q6v5_adsp.c | 11 +++++++++--
 drivers/remoteproc/qcom_q6v5_pas.c  | 20 +++++++++++++++-----
 2 files changed, 24 insertions(+), 7 deletions(-)

-- 
2.34.1

