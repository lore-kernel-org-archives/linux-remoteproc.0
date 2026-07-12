Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F24313293;
	Sun, 12 Jul 2026 13:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783863337; cv=none; b=i9dRrYna7sqY/rDn/xrT7qSBQrj1MJi0lpb/+s6SPl/36Skx7lXjLx0TC3Md/e5vcOG8hbzMAoUOLdnfXprVjbUb/GZUIIFwPabV+O1VkqXneAbk1eDTdSO2TBMfK03EH7FHOdq3PHFyiS49rWuVJzwA1Bq8RxkUEfWWpzXtbZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783863337; c=relaxed/simple;
	bh=JtUeMQCih4mrs2WsrmXM73SFd2Lg56RqDDm03M36dHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpq5hFwRQAGKMQw5Ch3KuKrvzt8dVn9NvBG3msKtKkssJYFZngkLqQ3ubiwr5LPMp1eYfkTZsBA6hjSMLkHaJ+TUCz9RiAHbVRgjin7KZu3lDNw0ik2KbQSRZO61MkWryMjrnAduTHLSGYJ/Bh7yA+UgIe0L6XIaTTT9IZAPtIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lwOG6rKu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lwOG6rKu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7181F000E9;
	Sun, 12 Jul 2026 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783863336;
	bh=g9WW04gU1cWq0ByKKgL2f3qCoZEv0DQfjDgLf0i8Hvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lwOG6rKux2fGUSuL8Y41jY1oOMShRwMUEN8ASmplnHpeXOT/iJrQtbXhkRWM9bDRO
	 dM3oKUo0sPwEBTFSBqApmZJzGTZuGduQYyRH3mqO5boviJo2IHPMtAcveZovUq9rhE
	 n1NIJvKp2ahkHHnlK2k49ToJm1XonvgoSUDj2VxZm4eZQ66wK/+h86y8KZGFcah0zg
	 hAIqnRwMaxL0HU2EvNEfDGyhejuDjP7aIsWK/y2iYNF16uFjc/63es+TkKZCJqCwWL
	 FuyD9UQXk1mSjvyyEGpZKywPbHpIv56+PO1DyZS08FMisKbHZ2dS1sDyhwWkTXfdUS
	 VM1zDfJR1N4KQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Create platform device for BAM-DMUX
Date: Sun, 12 Jul 2026 08:35:32 -0500
Message-ID: <178386332951.266306.17526458782322664639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711-qcom-q6v5-pas-bam-dmux-v1-1-1e9231143b79@oss.qualcomm.com>
References: <20260711-qcom-q6v5-pas-bam-dmux-v1-1-1e9231143b79@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 11 Jul 2026 09:34:18 +0530, Vishnu Santhosh wrote:
> Some Qualcomm SoCs using the generic PAS remoteproc driver (e.g.
> Shikra) implement the BAM-DMUX protocol on the modem remoteproc to
> expose network data channels. The hardware/firmware resources
> required by the BAM-DMUX driver are described in an extra device
> tree node below the modem remoteproc, with the compatible
> "qcom,bam-dmux".
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_pas: Create platform device for BAM-DMUX
      commit: fef55450dd4e8511a2c080f9b873e9128240148d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
