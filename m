Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F070014884C
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Mar 2026 00:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670809; cv=none; b=Gyn/XywRaVB/r8+teYGaO89hZuKv9EjczAnrF6tPy/MnlrTIHPYjDbZzNarY8JASTmj8jVyTsDFwCabt+wCEBIIQ1xUOzHS2n10h2ueEkl1KBFP1dKsDKc0MpJjmgZl5aY7DTNc5j1iy4o2dra2QajLndOEXDAeuPdC2yjHTeRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670809; c=relaxed/simple;
	bh=jYZWIpEDvUIg6uWxGLa3xhe50hws5xo7lklZCfYbEXM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Herk4cO/22blLvf5rCCnbDnrlsrGnPUkCYpOZNEuCN44XcAljCWujORFNZrJLXdI7fmdG7ZxHZBEkJDHvXzlPBDHHo7dwn0jVGbDw4OabK5Gcx9yrIrK3u1WvSgBdj0q5x0IFKc1HuAmLG+QijjsoCADlNzEnqw+hG4VzYnxIkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PrBuclfc; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrBuclfc"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d4c3896e32so4216436a34.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 16:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772670807; x=1773275607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=upUg3ZxOy0Ji9DU1YGXp3LZIoYzzoDo9wLPMsUxZBkY=;
        b=PrBuclfct8VlIo08/TfrfQnS+m4VsG+7Fo8rsfz+zNy5J5qKzLAyu0mVTY7c8VYwCc
         6iVsFPsRFtCElSERY+F51tHh2CUhtTplrtWfG3i9hPog6cf9JOPFF8Mzg8cu7UHsrDt3
         oC65y2ZmyO6Ip+HzI9SDdrbfpjztsoD5p7Nm1dtkEtVcqwSRgx1QShcYF6gigrk5WYXv
         +rGrSfQGafaMBGt9jJ56NNNxja36T0VBaV4ZxfQmq6XUr11vAarjfwxT4jv0TsWo2flE
         9lokSPrH/vT4oFCbs8xuLBIHPqxtlQmbBYVoheipk3SrF0Ja3F1j0ACC8tjJyzROrNF8
         c+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670807; x=1773275607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upUg3ZxOy0Ji9DU1YGXp3LZIoYzzoDo9wLPMsUxZBkY=;
        b=GNuRWhmsvi/iFsW5DOdQ5J11cXfwWVrv13ij4e2DRPgOwPRffhiVuQjdRBtC4vWVwd
         HsV+rsGhIz0iKQ4SJKV9bXBMuE2euD4B6dj94EOFnF62JOqn20lAKZ+UHTff90Uyh7Gx
         Hx/6ozW1o3wLuhCMEZk/+EqPmHiiHYBSyhXyq7ouJiG/BeeT09zXvfLXhiRPZnLegeCZ
         DCquHHwGHSzXZHNTlTPMDBLJuTJiqHPNEoINYLCs/bSCQW/0E6Qos/KBoTziA9Y15eRG
         q/GiJNLXDQvQPJZMn/OdCKcHEmvzAUP2jamN5riTOw6v+QYVUpWZ5rwLWoVYufpCDn0U
         Y52A==
X-Forwarded-Encrypted: i=1; AJvYcCUk6HqiDdLvBRQrIuFw0YF12JzLrEsxv1/e+mw9uW9FmxbbeDefxqCw7hdRUvjsSpf4OT3bL04WPArnZCOq5kQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YwouBmWCqBPY8NWxSbHURBQmvgyC/2+6SeXDYA671sGhVnsq25H
	+QQnZ5441Z+f1KPhBdU6b1gJDXhFQrsfNXKYpwZzTctXNMgrcOghRcp6
X-Gm-Gg: ATEYQzwOrw2ydCR1/tX556c45H4JD3eVzIGSquLUYBkecHK3Lsgy9oIjPmb5EQhtL2Z
	49+vNbx2K4dmOU4NZYBogRFEV01YNJorpnHOYvz0moUvLPvMesnG5BmoiC02b5XEaUQMPQWUas8
	SBm9tO701OCOkoqZp2lEyY+D4fnOGT/tsr+Qu6r30mwApTh6/YXlyZPe5/cVk7nT7SxV7f+Z+bW
	KDX0XJ5SADmlQHYVXi59wISFQINvLMlf0QdfUywnK3ZwZWE4W5gX0fNhWNfUGE/eDDjNrIupjjC
	1tgkmAI/HQXZU/U3DYDxwHf9Znv9x7pfqaQEHzodgw99ZcZ9+Lgk6WqKunnYcI+2Os4GtGUBdjP
	61BauAZm5vmHcFZ7jnF4kT+Y+idAF+nadsfBl0N5AEP71LNm3R6/oRpIt3zBpxB0COxwpWTvY8q
	qEzGODcv0NeQ5s1etSMJgkZDhFPvtGbSXt88Swx0wBym4NrxNFaYPIsB/nNhvUUETxS7mDa6PRi
	nTfjLkzciBKr3rGtaIb5uPT5zOG3Aq/P0hGT1t5NiTtM59VUxs7
X-Received: by 2002:a05:6830:3983:b0:7cf:c482:4982 with SMTP id 46e09a7af769-7d6d13b8e27mr2432945a34.25.1772670806981;
        Wed, 04 Mar 2026 16:33:26 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644dd17sm16633834a34.5.2026.03.04.16.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:26 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH v2 0/3] Add support for Qualcomm WCN3610
Date: Wed,  4 Mar 2026 18:32:50 -0600
Message-ID: <20260305003253.1022386-1-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The WCN3610 is a 2.4GHz-only WLAN/BT combo chip used in some
cheaper Android and Windows phones such as the Lumia 550, and
IoT devices like the Anki Vector robot. It shares a lot in
common with the WCN3620.

This series adds support for the WCN3610 across the necessary
subsystems:

   * Document the new compatible string (patch 1).
   * Add compatible string in qcom_wcnss_iris (patch 2).
   * Add rf_id and CFGs for the WCN3610 in wcn36xx, disable
     powersave for this specific chip, ensure it is 2.4GHz-only
     (patch 3).

Tested on an Anki Vector 1.0 and 2.0 robot. Support for other
WCN36xx chips has not been affected.

Changes in v2:
 - Move the Documentation patch to the beginning of the patch set.
 - Move remoteproc compatible string addition to the middle of 
   the patch set.
 - Add Reviewed-by Dmitry (thanks!) to remoteproc compatible patch.
 - Move wcn36xx driver changes to the end of the patch set.

Kerigan Creighton (3):
  dt-bindings: remoteproc: qcom,wcnss-pil: add WCN3610 compatible
  remoteproc: qcom_wcnss_iris: add support for WCN3610
  wifi: wcn36xx: add support for WCN3610

 .../bindings/remoteproc/qcom,wcnss-pil.yaml   |  1 +
 drivers/net/wireless/ath/wcn36xx/main.c       |  4 +-
 drivers/net/wireless/ath/wcn36xx/smd.c        | 70 ++++++++++++++++++-
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h    |  1 +
 drivers/remoteproc/qcom_wcnss_iris.c          |  1 +
 5 files changed, 75 insertions(+), 2 deletions(-)

-- 
2.53.0

