Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D617EA
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 Nov 2023 01:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IxVh4TNX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0494C433C9;
	Tue, 21 Nov 2023 01:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700528462;
	bh=WydedWHI5hgSzmjYaAgFcEvQrWisnvd0Tah1sl3VwoE=;
	h=Date:From:To:Subject:From;
	b=IxVh4TNXYShV76QIhivImPSPPbxiOznWaUYrXGLlJuMMX1OZAnpBDWSvUvrH1vXA3
	 OmhyhsgIDIUyHhhOB7bmYA3DoC/z+2yGpVB6MCIm8ac3Fmf7yKK/ezR7WPKJSSWRJ0
	 kh8yN2u/i+DVBiY8+IPszVbZH3j7xY2ICgpUe7tw=
Date: Mon, 20 Nov 2023 20:01:00 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: linux-remoteproc@vger.kernel.org
Subject: PSA: this list has moved to new vger infra (no action required)
Message-ID: <20231120-axiomatic-imported-bobcat-1ecdaf@nitro>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

This list has been migrated to new vger infrastructure. No action is required
on your part and there should be no change in how you interact with this list.

This message acts as a verification test that the archives are properly
updating.

If something isn't working or looking right, please reach out to
helpdesk@kernel.org.

Best regards,
-K
