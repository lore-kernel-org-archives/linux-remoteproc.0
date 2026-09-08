Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938D148F017;
	Tue,  8 Sep 2026 22:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788905414; cv=none; b=gwMzArNFuiUJ+OPDCOaSMJE2eQvghzkRSnTugkhLXyqG/5S6xAwNItGYpDGrGByaMdqPbVzRuBCVFiBtzMqmxs8xOBdksxwDH52mnr/8qMagQ9glR5AhOkJwKpEqmvkQWdNsEPapOsbsinTbh+POBNPJRGDAhlSHzNp+OUeZWuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788905414; c=relaxed/simple;
	bh=aJ+DAVjTt5QVEU3NCrdpeAEJi6hWWxEYiDpAKAueLxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=swoapjukoujJV+E9SLfTzsUBKXdanPYzLbw6AaAqfOruJ4IQzWm1tUuaB7F3i0Bjz8XKzXN2g6qZgTAuXNFoXjrhrjw0NObAc7FXrUlZXMaDgUqeAcJlC+0TIIX11c0mQa89b6ylPhTLO+VVkAp1yWQShFUTujDcFcm/EfgsgGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UsCtT6i3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UsCtT6i3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BBA1F00A3D;
	Tue,  8 Sep 2026 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788905413;
	bh=seKjOh8A2djDcz5JdoNucUq7lBezRfZyhy3wonVf/uI=;
	h=From:Date:Subject:To:Cc;
	b=UsCtT6i3JK/ZUw0hv1zLvqWlwvWgg8jrs109bWl38piHLJaw0w0TZJh99CnAcon7B
	 x/1Z/amNFkBFmV9xJgebG+VdfO7zdOnqy1NCy01BZxWqQXZKQI5mp1nZzZmNIah6Lr
	 OyZfZzJFe0T3QZ3pN+kUqKfTUymj0Lyr1xQ9G3zzrDKhAd7GRoG7UIijfjE3nAwS79
	 Mab7iLVmfoyk2GEM+O9IRn0jS4jX59eDM1da2bgv2U5gATo4J87uKmQf4//053gX4T
	 dJbysHroGx6V/iwBj4ResR3ectnv7rtxyPzn/jkqRHqYPN0IJmjjecFvNb/hfzL1nb
	 tK5y4JNLJVTlw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 08 Sep 2026 15:10:06 -0700
Subject: [PATCH] samples: rpmsg: Fix mtu printk specifiers
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-samples-rpmsg-fix-mtu-print-v1-1-f995518f0a46@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXM0QrCMAxA0V8ZeTaQdjCcvyI+bDOdEVtL0okw9
 u/W7fHA5a5grMIGl2YF5Y+YvFOFOzUwPYY0M8q9Gjz5jno6ow0xv9hQc7QZg3wxlgWzSiroemo
 Dtd51HKAesnIN9vv1dtiW8clT+S9h236iMYW/fwAAAA==
X-Change-ID: 20260908-samples-rpmsg-fix-mtu-print-1903f03216ef
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
 Tanmay Shah <tanmay.shah@amd.com>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3031; i=nathan@kernel.org;
 h=from:subject:message-id; bh=aJ+DAVjTt5QVEU3NCrdpeAEJi6hWWxEYiDpAKAueLxo=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFkL2g/kWglxJv7wnDDz/7WZ04S/tvsWL/q96QqHR0CHT
 cISuWP8HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAipT0M/xOct3WHWF2JmbdX
 26OmlZF72vP1r25tOifrxiIxvTT7pwcjQ5/Lg1k3d08TVLpstGSt9JVpF2/L8xUlznqp+uxte63
 vWm4A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716

When building rpmsg_client_sample.c for a 32-bit platform, such as
during arm allmodconfig, there are a few warnings due to using an
incorrect specifier for mtu:

  samples/rpmsg/rpmsg_client_sample.c:68:59: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
     68 |                 dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
        |                                                                 ~~~     ^~~
        |                                                                 %zd
  ...
  samples/rpmsg/rpmsg_client_sample.c:72:50: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
     72 |         dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
        |                                                 ~~~     ^~~
        |                                                 %zd
  ...
  samples/rpmsg/rpmsg_client_sample.c:79:17: error: format specifies type 'long' but the argument has type 'ssize_t' (aka 'int') [-Werror,-Wformat]
     78 |                         "message size %zu exceeds rpmsg MTU size %ld\n",
        |                                                                  ~~~
        |                                                                  %zd
     79 |                         strlen(MSG), mtu);
        |                                      ^~~

Use '%zd', the proper specifier for a 'ssize_t' variable, to clear up
the warning. Additionally, modify the last dev_err() call in
rpmsg_sample_probe() to reuse msg_len instead of calling strlen(MSG)
again and use '%zd' throughout the string consistently.

Fixes: 1029c89bafc7 ("samples: rpmsg: Add MTU size info")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 samples/rpmsg/rpmsg_client_sample.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/samples/rpmsg/rpmsg_client_sample.c b/samples/rpmsg/rpmsg_client_sample.c
index 4c43436aadb6..8c629065c64c 100644
--- a/samples/rpmsg/rpmsg_client_sample.c
+++ b/samples/rpmsg/rpmsg_client_sample.c
@@ -65,18 +65,18 @@ static int rpmsg_sample_probe(struct rpmsg_device *rpdev)
 
 	mtu = rpmsg_get_mtu(rpdev->ept);
 	if (mtu < 0) {
-		dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %ld\n", mtu);
+		dev_warn(&rpdev->dev, "invalid rpmsg MTU size = %zd\n", mtu);
 		return mtu;
 	}
 
-	dev_info(&rpdev->dev, "rpmsg MTU size = %ld\n", mtu);
+	dev_info(&rpdev->dev, "rpmsg MTU size = %zd\n", mtu);
 
 	msg_len = strlen(MSG);
 	/* make sure our message fits in a single rpmsg buffer */
 	if (msg_len > mtu) {
 		dev_err(&rpdev->dev,
-			"message size %zu exceeds rpmsg MTU size %ld\n",
-			strlen(MSG), mtu);
+			"message size %zd exceeds rpmsg MTU size %zd\n",
+			msg_len, mtu);
 		return -EMSGSIZE;
 	}
 

---
base-commit: 70e14d5db3a01a44f6c3217bb3dda2dd5828a507
change-id: 20260908-samples-rpmsg-fix-mtu-print-1903f03216ef

Best regards,
--  
Cheers,
Nathan

