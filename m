Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40801CCEF1;
	Tue, 22 Oct 2024 21:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729632923; cv=none; b=FZRTxcsGN67o4etgiPKVAf5PXzPzCAKdJz+H066Hh41hOTjCQTTUwxmskqPloh4F1+wuqJP8rc35UU0Qru6Sf+GKFJLdQEnoSPGh9L8loBVp4HIqoGVi3DDM2xjdk5WMV1Qog3WTmlt9sEAx/Btrmo4ZHijMrh5SSY6fqa6KBn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729632923; c=relaxed/simple;
	bh=9HkTwBHIl+4fWbc0RXcjQqJa73jC831/0ypjtBYZmXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZvxYY4tlmonHIMxgu1rx2XhqKcUAX5MMnFpQhiFnag4budCGG6g+xYWy4Mqso2dEq8PkmKCS168JaiJnPmd15eeCuzdmE1Mg77lCEyOOsyNXpVOcRxvjFEOCiDeZRA35mn97K6nIG+hk6dpLfFQ9lwaDwLYECEF1LBvVf+uO8LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGONeI+s; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGONeI+s"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20cdb889222so59358155ad.3;
        Tue, 22 Oct 2024 14:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729632921; x=1730237721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9HkTwBHIl+4fWbc0RXcjQqJa73jC831/0ypjtBYZmXI=;
        b=NGONeI+srd1KrTRcF2V1LQOoO7yACDMoUJ0phHMF7oWJVGc98sOn35/4tH8rgwwlyu
         1r94wtpwIh1baSviiIXh2a98nICXm2msKwYPASFONB23Bcz++Pm0sry3KboEy7qtpXfd
         fKzD6QxT8FgS0TgkkC01DyaA3CkNy2doGwtJHPwqutzelhi5Ll+mM76DsVenFF8Markq
         H8Yinaih2QoGGyhcpNBjjZC0MeFcSqxXift8OKVCDRPwumV5IlV58FoB+yN2UJzKqzDb
         HObZFvhY+50HLy3kmo3Mv/MUGDPB5mS1SQSn3fJ9TI5s394PAOlWAgOVGEMN/zGfYQST
         kmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729632921; x=1730237721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HkTwBHIl+4fWbc0RXcjQqJa73jC831/0ypjtBYZmXI=;
        b=Z4MTMiqV7jN+AVMNdDoXRyxJtpF6W/eOd5PZiovaHJKiR9rcFu4kIprmwKO+5vBkG1
         tDNVaISyBRXRgO2ntuL5ZKXy7NUUVJBTTk+mdR7RK+9VbVMDSJt4JmLeHpEZe+Sc7KXa
         ugb5X1NBgrKkz31divDznwUjrzmsdrAw56bxWgmTDzX3YDYmwE2q4/79dfoaUt9tgoxn
         cFwGO85SjRiJHJACd9deKoVSCoIsy8rjifCNiOC1V+7DIdkY6cB4RFwrq5s1sMLnDkBm
         NUYOiZV4WW2NjAGaKv7L899CMU9oswHl6BejWFM5uEknBjbESHuLpHLL62AL4Nn0zXNi
         pQNA==
X-Forwarded-Encrypted: i=1; AJvYcCUc9wqvKUBRKNepGkZCZrwcFiahYuLIDGtP2biaU33FBoTnFhehCMKWn9Qe56yd5QFXO4oab878/ro=@vger.kernel.org, AJvYcCViHanzzayUxCwMcRHjFRvmhA8y9sIZzGDk0kaQVZCrjFNgtqq+P0ofiH83Kt+tNfDcBXX1flemOVkGSat6@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGHINLrqA7OCVZs8jTymZVJrK7wmiugnN1K15Zmu6/DTKuvL1
	AnugT+MM5cvnnEa0xjCtZQbciiWXrFoMyxh66+R7ylJLvqYH+IsM
X-Google-Smtp-Source: AGHT+IFn3p00Ey22ySvpESE2IURm7SgTJfYs4aw6WFV2IqbMJG2rDRTcHYXqFjAQfktwZDLiDhLpQQ==
X-Received: by 2002:a17:90a:d903:b0:2db:2939:d9c0 with SMTP id 98e67ed59e1d1-2e76b5b8fcfmr379816a91.2.1729632920898;
        Tue, 22 Oct 2024 14:35:20 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed73fsm6726369a91.44.2024.10.22.14.35.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 14:35:20 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 0/1] remoteproc documentation changes 
Date: Tue, 22 Oct 2024 14:35:09 -0700
Message-Id: <20241022213516.1756-1-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series transitions the documentation
for remoteproc from the staging directory to the
mainline kernel. It introduces both kernel and
user-space APIs, enhancing the overall documentation
quality. Additionally, an index has been added to
ensure compatibility with the readthedocs.io
formatting requirements.

V3:
Seperated out the patches further to make the intention
clear for each patch.

V2:
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/
