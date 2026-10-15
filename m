Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59CF53D9E8
	for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792077590; cv=none; b=AC+XOETYwYYpHg7H5CSVNY2ZPvGaakP9BQAHT6Xqekm4J/P6eVeX55iPPWHQM0Gqij4OYLnRFJtTKbmbRWzy9kBC5uD3gYr8/8X65rjW/IgP29DmZgA0+IeFe4PoAOa0cQVngizWZt6KdSbdJf73leWt3QZ4Q/OpqY8FdlNnCGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792077590; c=relaxed/simple;
	bh=bEuFPOQiVyy1KX5sOgO4QdQ2fID4pTQ6O0IMMPI0HDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqIayT17dqKVMrfLy18miX3GUxD4csX5P5LB9f2AIesDA8VuRNdrt3flAvXsiWganTZ0rRAIyb5ULcUl2VxJrDvIZD7/9NkE+xgOMAJS2ESmxpiOYiZdV1R4JPA3Dt6kkQfBBKFAlztpjaLiZ+Tl3hpZjdLFdkhwDuNIJSmaI40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rquY1iOl; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rquY1iOl"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15756f82e8aso44091c88.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 15 Oct 2026 08:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792077586; x=1792682386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bEuFPOQiVyy1KX5sOgO4QdQ2fID4pTQ6O0IMMPI0HDk=;
        b=rquY1iOlwAtqyt/71W9yojpIgIBne71gySEqaHTRUimkXaf/Yde7BbqHeZNC8h4PiA
         ji7ybfqqwetEyUE7m/QFUbqsunehF3EgKpR6RASegiBV6ahnqOzVw9mllICLGCTYxzyf
         Qlfph33H6XF5cAasuxizHXdoRjbdAfJJxYHvtRxF//JlgA6WoRV0UtnFg3y7riEHIBtm
         uRD0leUkd4HFYSjaVBTewpmiMavApqu3K7CgXintKDuaNQz+ZJYdX/Yff5P1Oahxyqh4
         npuwR+2vVoPq3iHouM6l3TqA89/VEQd6IGcb9eNK1xATBKOu8uWnneklipOCMiTvJ/BW
         RcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792077586; x=1792682386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bEuFPOQiVyy1KX5sOgO4QdQ2fID4pTQ6O0IMMPI0HDk=;
        b=EYpvv5pukbhmXo7ZiE1dANPnU3CeNaHzlppUF+0zHtepJa3c1+1uX1PR+Zqjp+hO5G
         v8r9cEAeIcflkX4VQNt21WKPWscAHcsOhJ0j6GHLBqGnhGekPFlO4wBXQgfs3ewHH+Za
         mMypg5NjFqnO5gwjTE/ZhYTyX+16xPCPw9yC/rvuJ5qvum8GJ+096qnO6tEEIYZPxiaq
         SKtXKr2qbCYXYj9mOzKsAplmvf/cQZMupL+nMR3acPSXEaQEUvih/NcG5rXFNm0bUuJa
         862Dxk5sHE1sFWSuFB8xnUWpdghjLh1rcN2guDS4l8ckHdFiAXIbQTIfX0FwXodvl6TV
         KF5w==
X-Gm-Message-State: AFq9FYJPieR0Dl0OxV9r5zzwTH8mcxTMsVhFX47/INXhV7cyHJwwH2MI
	50WnGZkEydcL2WYJuYQAV33oOSGXnHYU9OcY/CLKsKZE1rwZkKR9n/Bs2vXKYhlq
X-Gm-Gg: AYBFou3hVXA3gyXQzauIbx/75TzHIIvr4EvDbixC7kOUBZoDlPRcVd4a2eZpNFChEcZ
	RWJkHDnMKGo1NLC99DdX1umxH2so4I6MwPe1ii2ei8knBLN1QAZIUCIZatGRep8paFV/L5smMha
	TWo6rBYhUgUwX8lMjl3lK8aFvos5BcaHgVQojgETGlE2ZpYDZJHYv2HaIYaPjPJpzb+yIfhCKXR
	75Q324u8aNsynPAZ62Jb1ShlVDx8J5jVNPZAHgluNwvWIiOQqbVNBKX3IsSb3emYWE8MHNZfSOh
	oMfYcQF259z6CnA50smmvHi+1leEWyHg7VPVdAhN1UeO20ic4IkBVya/LZEUSo4lfrCcbVzzPeG
	tw+vgyZbwCSgM20WsuQeZZ7ZXUkKwjuzY3ltnXiOvDFYE63PmLr2Hxld6CUP+y0enk+CQMakHof
	warSN72JG4WiQmICano7p1ZqECiV3nLZu1twpqzjbxFw4nUF5GlWnGerYBNOMO2RvIicrCJUGV9
	Oo=
X-Received: by 2002:a05:701b:208a:b0:152:dd1b:4fa7 with SMTP id a92af1059eb24-1825339eb73mr289092c88.19.1792077586315;
        Thu, 15 Oct 2026 08:19:46 -0700 (PDT)
Received: from JMD ([117.213.200.3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a3f6186fsm58994476c88.14.2026.10.15.08.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 08:19:45 -0700 (PDT)
From: Atul Akella <atul.akella@gmail.com>
To: mathieu.poirier@linaro.org,
	bjorn.andersson@linaro.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: mtk_scp: fix da_to_va() bounds checks
Date: Thu, 15 Oct 2026 20:49:38 +0530
Message-ID: <20261015151938.1331-1-atul.akella@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
In-Reply-To: <cover.1791198233.git.atul.akella@gmail.com>
References: <cover.1791198233.git.atul.akella@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Just following up on this series. Both patches are compile-tested only (arm64 defconfig, W=1).
I haven't tested them on actual mt8183/mt8192 hardware, but I'd be happy to help with hardware testing if someone has access to a suitable board. I'm also open to addressing any review feedback.

Thanks,
Atul
