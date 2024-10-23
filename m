Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E065C603;
	Wed, 23 Oct 2024 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729661644; cv=none; b=oeTiWWspMoImy7rLS/j7vSLevRdBQd/dd8lpLczfoTE++TYGvNM/G5hqKc4/4M6g1nh4UzTJiK7HEEruzQAWTsRVMCBY3mrVsdZ73/ATxeh0luPrSOkLOHyt/XvZQ/CEeXoDIjQrzZm70CMOa9i7S+UZPHcVELSDsoimBGFnni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729661644; c=relaxed/simple;
	bh=2S1bcZodFhvcdZA4mjINP6OKmnA+FrholvpVMWYy6HE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bbcSaSfbC3MTzG4o3XIn7MXvemzWGG4iR4XRVuHUyuYh446DKL/cxjtJexEIPtZcny1Vp85kHtovOBMSkhkgXe77egRf04ZpxaNxGmOL2/wLjuQbA+U1kGgNLbEfjSgqN6zFvlX0ZJoGHEYpHjMHdFbsFcjYQERwRiH3zx2zCLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGvJEo5r; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGvJEo5r"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2e30116efc9so5221432a91.2;
        Tue, 22 Oct 2024 22:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729661642; x=1730266442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2S1bcZodFhvcdZA4mjINP6OKmnA+FrholvpVMWYy6HE=;
        b=TGvJEo5r0bIE/agoE3sxYyX40lYVksq4AxBl53AJu9nMVouTBDVX+IRKft6IEbNnZ+
         YbVPpLpo1w24d6DDRJEvW91Pjxg1jZps+3YuRUwcFB1VzzBqFh0xbbVVs+doAWHfP17S
         A96P2WojDTGT1PdKLFBtwyAZCt/Djz358YTV0FjHb7at/0FdDZ1oYzkAGFAyQTFn5Xt9
         tnkEjUDU1kimDIG40oKGsmQMVFKhuzF9sJ4vMdZIuNCXIzy4epFdssEgcMV3t+Su6MEF
         DL3U/+/xu8hkXP9vV6D+ouczVcqylGJCuI3hPXs6Nw3Ugjl2QXch8o/Fv3VLhHUvf8y1
         m14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729661642; x=1730266442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2S1bcZodFhvcdZA4mjINP6OKmnA+FrholvpVMWYy6HE=;
        b=iU4KGFer9z6XlLsutfB4QaCGiSbXYkFE7AUgwdZurSW4jMUp/FuIXxKlrZdNTM8htF
         cT5M6wWrkDRMqcfRHbC1I2Its7KQb0+YYQBA8fv/I7FSFSs11KLLZpQLhMYpceNz9SPn
         hp9DOcsTGdw7K48QzYLVqGUZfE2j03JBf5PCDWEPyPd/Ckdc+IJybYE9o4r/UyhwYFX2
         VaNjE6o/eB7aUDvCMSpJWIZZDiYF/ByGU4RrFkt6vBfYV+qT39WPoG3ud1osL0vVBun+
         TwjTS6/NJDNStkBPr7sQxjLKA+N5NLibm5sn3rWtZFtrSkNwBG+/FWOajBFl4PAUFh1s
         jWbw==
X-Forwarded-Encrypted: i=1; AJvYcCUMtcNAC2/UysLgPLD0YrgjIT0QL/1LwjyMkJWibogGK48U0rju14YY0rdLl4kwV+4USrKtZq40iIk=@vger.kernel.org, AJvYcCVJOaSO/aIccyjQSZ2Zdi7qn136XitK3+I9kBGMd1Klo2xNXazYm8ljMahbXVLWIRxKUE9HIpPZ1Cpo4uH4@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnC7Wh3wYvNDRbiD87A5jmHkY/M5OhQKmarg3Rqjfa/IaKbTF
	BcFR/yBYkNg8C7XWm5CQYRazD8dGqdcOtsD3fDvWBuyLxs/a3n50
X-Google-Smtp-Source: AGHT+IGDMby5/Ac3E1v2ueAS2bGUnivK5zRh9tBKrPFXvPiAxy4eS4qh5NuGdKioc/yOZvxANmrH9g==
X-Received: by 2002:a17:90a:de8e:b0:2e2:bd68:b8d8 with SMTP id 98e67ed59e1d1-2e76b5b59a9mr1644320a91.8.1729661642502;
        Tue, 22 Oct 2024 22:34:02 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76e0877a6sm428695a91.54.2024.10.22.22.34.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 22:34:01 -0700 (PDT)
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
Date: Tue, 22 Oct 2024 22:33:50 -0700
Message-Id: <20241023053357.5261-1-yesanishhere@gmail.com>
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
quality.

V4:
Fixed compilation errors and moved documentation to
driver-api directory.

V3:
Seperated out the patches further to make the intention
clear for each patch.

V2:
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/
