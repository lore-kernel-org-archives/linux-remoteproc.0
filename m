Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246181CFEB8;
	Tue, 22 Oct 2024 21:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729632924; cv=none; b=gR1rOCIiDU263X0dNS9maFkMKMiBUL54niLStzTycyJ3KRJ+NP3xHcxp8cQwCmKuCDeC1lXH5X+mlBN+hb4Osam0/bfIYAHbOLQn2fI8zcrK+ic6RkX0MZKJTOL3HWi59W9CXQiib11rCfPw7tWUwlq77tGUmIsOlV6bY8ZTr8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729632924; c=relaxed/simple;
	bh=dFlyp/yLqOJIbJE/f6Jtl/z74dJgLyEpbG6i0Q7bXIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EbGIIZSGck4vm6cSnNV5sX7fsW0ePWo0d3XMc8zPVGTYOh72kp9npVjA2m0QiiTWf9Nkp8uI3uVSkvKl9JTw9YNIhDFt4H3+UO0TRhrUSIDTd2TSO8z7ocOexKE0A2RUB3R6luRcP9CqGjP50T2N9NOSvZy/2a2O64IGQjeMsJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AaYaZz4E; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AaYaZz4E"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so4461766a91.3;
        Tue, 22 Oct 2024 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729632922; x=1730237722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJCRJ5Dxh7BxRk94oDLEQNDTZ7KWVljyZzXVZCPXEdc=;
        b=AaYaZz4EuLLnEhfkmabbiQJ8F+2GN/Hu+Z0ER45kIdseAtSvpwJ9IWy+yCbE+A1ERv
         EYNcYYhgYhpWmKawT/8aGXn9cbYIfFwT3D0X+39esA1ZN+Bj5BUXYd4c+jAoJfGujVT6
         qaH6lN2KNJrYOtE3ZX6WWiAquJj7hJGVSlVeB0qqBWIbnSR3pmGzXYNiN0z1onZJx934
         9pkXUFcONJlwB/MtXquTC8Icts89aNf+SJKHoo96xNr9MMSqhIgngBjZxkJPeMYV1pyA
         9dLsAM3i0Tb5thlXt+aO7PYwizWZltOanQe4/c0L9FUmdqukMFttncAjUIA18Pe/gh74
         KPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729632922; x=1730237722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJCRJ5Dxh7BxRk94oDLEQNDTZ7KWVljyZzXVZCPXEdc=;
        b=MVPcSoOgCyOd+v4W2HHIxz3F5Ac4rw1++cKgiSA1wSGn4zCYm1QpCusWwBbVyJkOsS
         GR76IudI7lEOwjJ3LCauxMSGgfOH6jzztrWYZIg3NukGrCV6SZHLxwrl/LtMrOIJYleT
         z86i0OMBWY+XT/S/RcPX/BKn13GDZvowNnmcGDl7t9A3o4PJ3gQuOWTqUzUsbVrW+RIq
         KX+npOEVxW0bgUPxWdE38ZASLPSiCJCyujMiM/+ADWIQe17/RQp2ptLG4D9rwJmJ+rPJ
         fG9Nz0iBvCEIfuAq3DsZzLqlHzq4Sw+72VTi35ehALM0xA5OELwX85YHnjpRnqOWu0WB
         7YUA==
X-Forwarded-Encrypted: i=1; AJvYcCUgVZtS10aTU+K3eu0+JPoHFwZIi5JsupxoASqIXFpTZec2nbrey1Wqk02BIE/DqG+D1Lnib14QMW/jNqys@vger.kernel.org, AJvYcCX3rVrH8AiYIDhsF6DxfUdVRrg67QLd3oJ+YH0k6kVN3p7ohcWMNglHB0X2K5XIXW6x3zoD+g0trjU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhDRVwFlidz95hMdMroqIuM67L9DGsiVo0lSSFwGO2uEOmd2dR
	jJ0jse8cPXvQv9WnIOv+1KeBnX91pHCHuGXawVJhOEyV/vN+CYww
X-Google-Smtp-Source: AGHT+IFs0N2ydUZOyY7f24BZ4/6PCvA0vuqnDYUsU6D7S5VpS7u5qtPcD3CVOv+CMI128TdPwrqZSw==
X-Received: by 2002:a17:90b:4a41:b0:2e0:74c9:ecf1 with SMTP id 98e67ed59e1d1-2e76b5e4fd2mr438485a91.10.1729632922314;
        Tue, 22 Oct 2024 14:35:22 -0700 (PDT)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:1c93:3e9d:2c84:d5f9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ed73fsm6726369a91.44.2024.10.22.14.35.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Oct 2024 14:35:21 -0700 (PDT)
From: anish kumar <yesanishhere@gmail.com>
To: ohad@wizery.com,
	bjorn.andersson@linaro.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	anish kumar <yesanishhere@gmail.com>
Subject: [PATCH 1/7] Documentation: remoteproc: move from staging
Date: Tue, 22 Oct 2024 14:35:10 -0700
Message-Id: <20241022213516.1756-2-yesanishhere@gmail.com>
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

In preparation for upcoming enhancements, this
commit relocates the existing documentation
from the staging area to the mainline Documentation
directory. Future patches will add further
documentation to improve clarity and usability.

Signed-off-by: anish kumar <yesanishhere@gmail.com>
---
 Documentation/{staging => remoteproc}/remoteproc.rst | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/{staging => remoteproc}/remoteproc.rst (100%)

diff --git a/Documentation/staging/remoteproc.rst b/Documentation/remoteproc/remoteproc.rst
similarity index 100%
rename from Documentation/staging/remoteproc.rst
rename to Documentation/remoteproc/remoteproc.rst
-- 
2.39.3 (Apple Git-146)

