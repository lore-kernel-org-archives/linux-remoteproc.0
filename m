Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544242F50;
	Wed,  6 Nov 2024 05:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730869824; cv=none; b=mvkYrAz0WKZCGvN7zQUsIbr3VSgoZ4Vm4ESeuBWzysjBIkUyXicwTUWLY+FhNS45zmPTsWmTQ3eK/4G9sohMWiLkO9jZCM2lG+0zlMBM7YXzziq7CJj9O7ywb28Z77oCdpULwpMFMm9j2z9SVeR8QMLOSUHe3bKQ8g/L3Bx9dAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730869824; c=relaxed/simple;
	bh=sk6nClJft2TIKvzB6Hw0SeJ6iwv14nPpxUjUjJ6h+DE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gg91J2vXVuGCwxXhqeY+mFhyNgheIQ191DIdOrYWKAC/HPySgdEdsHggfOiIoRh1F5tRTV0zKPu8uPwndskOD5bp+lBaCEigMteCJLhvCyPHuzVMzwttGleKlrwPvKkOt79u94WbkduKe4ocbViKBl5OMy9ZA/5cxc6T4K6E0Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIX4oawo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIX4oawo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20caccadbeeso68023435ad.2;
        Tue, 05 Nov 2024 21:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730869822; x=1731474622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V+laD9lt/U32FXtuH2BFlYAYI8tzj0cNKJNCwws96t4=;
        b=XIX4oawoqwspvGzihUbU38eZWWnUvcfajKXfK+MdB2zh8gnokAqsJOaQbvLC8siqWb
         1wKVj4IvdHrF3eqDOyzvBt1WeVyULNUNfU4Iq1YRgN4ZA8DkSoTn2+qsyY/dTX2I2zXu
         VLLB7BNJHBPprlkzuu1t1g5FiG4LW0tFXXtmmOvnF0tCO52qPiQ5QEHrUR93b3MgxFoM
         azLnQF8BA8V8ulCjELoJw6yozAOC4hRo58yw9DoUA/LVl8JArJFQrWw5HJCYLolT3gHB
         J0PJy5/W/OsIwkrgRhXld72KTk4LraQKsn3CjS25f8mirql1HV60smrgSpeXi3260kuz
         YFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730869822; x=1731474622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V+laD9lt/U32FXtuH2BFlYAYI8tzj0cNKJNCwws96t4=;
        b=g8fjBIWb7mMbxjUnu9CnRuqQsXwfeF+Y42ijmD7ADURMF5C584SSkJUKncejV5jGhU
         AQ3+jBYFZj5n+xt5TePJ810FNHfAkd5BFyMCLacV1LasU0mIcIxI2scpzBlMTpJxC/7z
         QIl6WXmEQdjMc8FQpqeBQenk1AOD8NHhCTWrISLXNS21O8sz5+gk2iILbM+7COdQ3pYJ
         Aj4oijIQ7h6w6MVsiRNsSsoWLcOd1MkLpu5qAEkAecsqcr5x5vqRV4Dczc9FWWLQCSIw
         DuOvLtss28VbJspZFS0GdT/oUsw3lZkSNsS5yANCyZHUgvDJ5/AVws4oL9RbxCRL2cRp
         9tiw==
X-Forwarded-Encrypted: i=1; AJvYcCWg/hcWeWjlyz2iTrn28dEVBykN9vhIt+X7d9TU00hacI0mP0dfFLt04UhlMcf6odA7ifYA9qubFvc=@vger.kernel.org, AJvYcCXtC6jYcntAoLXkBsmALHWhFxbxXKtYHmJ736KOS6rpxhuWb2i8mRknNliWPe4JrHjdM8yXXQxZrpPG1POnDHrR+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0oY6/4NyVDUoTsXIsv25axIBJD1u7YNKnGG9e0zvSJSt7ewbj
	zhmI+YrMAXbltZbY9WVWFJADuNDNjHrenJITyjf8PmBWRCAyPUd9
X-Google-Smtp-Source: AGHT+IEFCrPvwvcuTqVPkoH7AkosVTN7qzzJrm2b3pQpr84kIW+PkkcuES/px8yRqEhkfHLWnQ/zrA==
X-Received: by 2002:a17:902:e850:b0:20b:6d8c:463 with SMTP id d9443c01a7336-21103b34f6dmr306869815ad.35.1730869822529;
        Tue, 05 Nov 2024 21:10:22 -0800 (PST)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:f510:c8a3:8415:793d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c0825sm86266055ad.207.2024.11.05.21.10.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 05 Nov 2024 21:10:21 -0800 (PST)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [RESEND PATCH V6 0/3] remoteproc documentation update 
Date: Tue,  5 Nov 2024 21:10:13 -0800
Message-Id: <20241106051016.89113-1-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V6:
divided the patches for each section as suggested by mathieu.
First patch is updating introduction section
second patch is for new overview section as suggested
third patch is for devm version of rprod_add

V5:
based on comment from mathieu poirier, remove all files
and combined that in the original file and as he adviced
nothing with respect to old documentation was changed.

V4:
Fixed compilation errors and moved documentation to
driver-api directory.

V3:
Seperated out the patches further to make the intention
clear for each patch.

V2:
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/

Hello Folks,

Sending this patchset again as revision was missing in the
last series also added cover letter changes.

Thanks,
anish

anish kumar (3):
  Documentation: remoteproc: update introduction section
  Documentation: remoteproc: add overview section
  Documentation: remoteproc: add a note to rproc_add

 Documentation/staging/remoteproc.rst | 68 ++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

-- 
2.39.3 (Apple Git-146)

