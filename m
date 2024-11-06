Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2CDB191F90;
	Wed,  6 Nov 2024 05:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730869830; cv=none; b=Wt2zqrPqaYFcxqiDimZOntWHnQeLj2/UQWeMlZLi9EZXHbqAddGtIDtF13Tq/LJXqj6KDdAzHRWDnBDAGdnXpcs9wpCRbHkfbJib3Qsa6SK9Ra7+WCitkvlQqQUhUplXoVjKfr4TYNlalAH5i2dD/TP8CZ8YwdkZJ8LvdZpPsOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730869830; c=relaxed/simple;
	bh=q/I54BCN7FOH7agzrRrVPUjzTgm2RIcPaI9LKCRWP5s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L2tAcvbhgKWsCKWPt56gO4/u983WjOzQ9HU6AmNEqkQ2TM95pHbl44IcDVRP+E9qHBCtpohX1Cf+TektyNC0y0spe9bHvssu8vJvUlyGakAPu95UrzbT3f4OwLkFbWPavZWIX9fJ2KUd4NtpqL8l6fE2X18XCQZi5ASTnMhf5To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KEyX4ZL6; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KEyX4ZL6"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ee6edc47abso2866004a12.3;
        Tue, 05 Nov 2024 21:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730869827; x=1731474627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMFHpngG6qydjgLEjOI9ZIqyN4Q1VIumJ5ShzygmB4U=;
        b=KEyX4ZL6hl9GruJ/PeYQ19y/DM67Q5G9AWq8NcRcVvzg/aG41TuLIF/FsqWt/PfG7s
         ecTe6iz9iOK08CaUhmsr6uRLEOYy7yEQVeaRAfUqp0TbZyAH6UKuhS06O29Y5Gp07iPr
         WDRK7TLkmK+dBM3Gm9t0kVNLgfTmdztKB53/J/0RFwlwFMlyeY1DLdu2F7ZnPyow0qc9
         vbxDSDylZOiCA+BarEB28ZRum1CfPclEpFN9s+LK9Kf1SqrKUAD+yPE6N7PGIeoVUM0H
         aEQO8ikoGMeaaINHZVmIBn4K+zX5iLniCnn7jaBw5jjQuZpiUnQYLuEPVhGua8bbrhrR
         8FOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730869827; x=1731474627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VMFHpngG6qydjgLEjOI9ZIqyN4Q1VIumJ5ShzygmB4U=;
        b=fY0bWJt5bSuZe/FNUnXIteIv8P0H4E/XD66zOTCO6uBHqRpmKfk3bFnQGvF7oAZPb8
         YEMZ4aBFKyq0K59qvPDjN210k1mc0q3vMP3n8eur7OVAFPPphhhBXN64PlVUm+azcWU2
         43/5nvmIgpkQsjvMgfmK+6Ujt/Dlq/HZEjf9jygvhZchQluEYKR7PAmh41WxSPtu6R8U
         6B9pciCzYBGGEZ/Ta2zYMuI7QhqW9EhLcV49X8pdWmQUeJJmPv9HxU1blWMIyHvYM7sm
         a6YxTHHvmST+Fr/Lus0k2gHo9ZS2iH6/oon/4ppKoF51Bx2sJjqrUPN4zX+fKUZH1tbf
         O+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUCWh8HZ3bRAjhyV2lzlQRXlWuhk8OAxD/WgCkYf55IXIx7I94jsUlQsHTCLqh2V/52QeQXOaAftkGDpQVyiYfJDQ==@vger.kernel.org, AJvYcCUkCIt7PYQOPLPkO5U9UL2lAE6zdhi6D3ZppkqRAPLAxdRYDhOyhysdskL7wQngo/oMePDgoJkebng=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgD3pH3aHYvCz0IvaBoSzqBpCwlPkiRXtnqFc8SY2dWFWqksTG
	u4Vl+KMPDttFmsx88gRaXGUAFYUv4+1AD0Qnkm9cUo3aGkZ/y3RVHzGgdSVlZWo=
X-Google-Smtp-Source: AGHT+IEZ07a8H44IIRS0lbR/0kzezpmGgNlibU1Spe1n9ePml2XXK+Hlz4wBUSgEGvciRY+2uTRx0w==
X-Received: by 2002:a05:6a20:2512:b0:1d9:18b7:496 with SMTP id adf61e73a8af0-1dba56234b8mr20054456637.45.1730869827580;
        Tue, 05 Nov 2024 21:10:27 -0800 (PST)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:f510:c8a3:8415:793d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057c0825sm86266055ad.207.2024.11.05.21.10.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 05 Nov 2024 21:10:27 -0800 (PST)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [RESEND PATCH V6 3/3] Documentation: remoteproc: add a note to rproc_add
Date: Tue,  5 Nov 2024 21:10:16 -0800
Message-Id: <20241106051016.89113-4-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20241106051016.89113-1-yesanishhere@gmail.com>
References: <20241106051016.89113-1-yesanishhere@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added a note to the rproc_add description regarding
the availability of the resource-managed variant of the API.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/staging/remoteproc.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/staging/remoteproc.rst
index e0bf68ceade8..658ef7a28dd2 100644
--- a/Documentation/staging/remoteproc.rst
+++ b/Documentation/staging/remoteproc.rst
@@ -223,6 +223,14 @@ If found, those virtio devices will be created and added, so as a result
 of registering this remote processor, additional virtio drivers might get
 probed.
 
+.. note::
+
+  there is a resource managed version of this api called devm_rproc_add.
+  Most of the times, you should use that unless you need to explicitly
+  control the rproc registration with the core. If you are using devm
+  variant of this api, then rproc_del will automatically get called when
+  driver is unloaded.
+
 ::
 
   int rproc_del(struct rproc *rproc)
-- 
2.39.3 (Apple Git-146)

