Received: from ewsoutbound.kpnmail.nl (ewsoutbound.kpnmail.nl [195.121.94.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E202426562D
	for <linux-remoteproc@vger.kernel.org>; Sun,  8 Mar 2026 14:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.121.94.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772978925; cv=none; b=oFre4s43ipL4yhz3DmGVLtFXS2o7sQnrPLHf32sfAcC2wgHaZgSWwLBcpicgLKIpEoBvXjH/b+tdmnfUp1WuWovymvTjmTsCNLAACxU1at8kgdGL620MLDTqE66IViFtu3VAf+5QxYY3d75JQzhodUNUNEtfpeQXWLrGW9pAKcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772978925; c=relaxed/simple;
	bh=l7ue/EKx6gu/+2KYYYVwXRWsDO2kh5nr4xTYMSq/Vac=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FI7uQ+3wir7M8Pd0jeadj4yNYW9bt9TvSmsRa5LvUhMxjcdEpfbhzz0Pl2amKqdPD7tNZZsjGKZdFiUnqaPkCAieYKS02KKWWXKSmzqg1LwwQDu2K29e3JrCHNsPdIONXdVEA4M9dfRPKNTSfWW2iVbIGmInuhyzTWOiTzrADYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl; spf=pass smtp.mailfrom=xs4all.nl; dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b=L23LcJgk; arc=none smtp.client-ip=195.121.94.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xs4all.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="L23LcJgk"
X-KPN-MessageId: 4f5d11a5-1af8-11f1-8a98-005056ab378f
Received: from smtp.kpnmail.nl (unknown [10.31.155.39])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 4f5d11a5-1af8-11f1-8a98-005056ab378f;
	Sun, 08 Mar 2026 15:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=mime-version:message-id:date:subject:to:from;
	bh=jFquOhWxZ2nDjHoKLntJHI15BD5TB4TQZSdgs1D/k2Q=;
	b=L23LcJgk6pFUlGKn3uA7d7h5A/bu1+RJ8T0DCJF73OMW0uBpgVG3GFpFQuBcxFjkwSH9M2O1JpkJI
	 Qyu7g3JNlonIjyUV+SsEfHt5lzOOV8Mwav8h0xW5kQOk+hG0IK4o5QHisWM55FQuUp8FELea4CEbl1
	 IgWYyDpHaouhAs6uj0XEDRZSVmzFuZVwI9StLK24dhoN5SSXdPjM1fw49povA3ORWyS0enkQC3Lraa
	 q4+j1R7Rqxpb7UKyUCtFxiHSEpJpO7kyNkbxOy+p6OvOCJI9IcCBlnjDyMsF2G5R3MC6vZkmee6sd1
	 PTzLes0DF4OL9aOEQnA4xYxy+HRuFzg==
X-KPN-MID: 33|C+HkbS6pA1iy0nC9uGOViKKgqW4YeixHABGD3qyt7ycNnj5ElEyYRM19XsTH+tg
 twyBQP8KfbDle6zBtjmb40wgAZRZI+HWkhpayMQeUUgg=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|Un2+v4wj4zajWhDrUUagfKb5pdELLzIbt6LMkqYoLXn8i+fINyfgWjooYGVCNBd
 AvM0SyjnE/pUPi0O1GSCupw==
Received: from daedalus.home (unknown [178.229.45.71])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 4c120a69-1af8-11f1-8011-005056ab7447;
	Sun, 08 Mar 2026 15:08:40 +0100 (CET)
From: Jori Koolstra <jkoolstra@xs4all.nl>
To: gregkh@linuxfoundation.org,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Jori Koolstra <jkoolstra@xs4all.nl>,
	linux-remoteproc@vger.kernel.org (open list:REMOTE PROCESSOR MESSAGING (RPMSG) SUBSYSTEM),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drivers: rpmsg: class_destroy() is deprecated
Date: Sun,  8 Mar 2026 15:08:49 +0100
Message-ID: <20260308140850.1138376-1-jkoolstra@xs4all.nl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The class_destroy() function documents that:

  Note, the pointer to be destroyed must have been created with a call
  to class_create().

However, class_create() is deprecated. rpmsg already uses
class_register() but the class_destroy() calls should also be replaced
with class_unregister().

Link: https://lore.kernel.org/all/2023040244-duffel-pushpin-f738@gregkh/
Signed-off-by: Jori Koolstra <jkoolstra@xs4all.nl>
---
 drivers/rpmsg/rpmsg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
index 96964745065b..948541656950 100644
--- a/drivers/rpmsg/rpmsg_core.c
+++ b/drivers/rpmsg/rpmsg_core.c
@@ -650,7 +650,7 @@ static int __init rpmsg_init(void)
 	ret = bus_register(&rpmsg_bus);
 	if (ret) {
 		pr_err("failed to register rpmsg bus: %d\n", ret);
-		class_destroy(&rpmsg_class);
+		class_unregister(&rpmsg_class);
 	}
 	return ret;
 }
@@ -659,7 +659,7 @@ postcore_initcall(rpmsg_init);
 static void __exit rpmsg_fini(void)
 {
 	bus_unregister(&rpmsg_bus);
-	class_destroy(&rpmsg_class);
+	class_unregister(&rpmsg_class);
 }
 module_exit(rpmsg_fini);
 

base-commit: d466c332e106fe666d1e2f5a24d08e308bebbfa1
-- 
2.53.0

