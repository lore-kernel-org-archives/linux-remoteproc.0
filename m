Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C655A4156CD;
	Tue, 14 Jul 2026 17:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784050725; cv=none; b=TmCqArMn352u88G4IBtMbZzwHC8xCg4kkJCakUz7DBAWy+VtVOJzJrMfbYTpyjI5EnqNq6tLjQuWUQOBr4B8jQ7BQdCehOyLttTe2yG7CaOO6kH7J5AJLuv8zqpupZFldLBvXiV23wEwo5F4DuKT4/8K//AqZN7/Ol8E5W09+FM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784050725; c=relaxed/simple;
	bh=e6fTfbWKGo78Ygb08M1bsQu5ZF6BgDLi7YOQ6OM86Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i6/Npjt3c+vHxs/118R1nvWUOndI8sdM1RwnCVFAzKGF6pbVUcZq2YZkzNdQNqKrSrbhp91X1qj7pBwwWbIshcglpIvP4fNhXqz9icTYDSdmrGabH12WAHELHne2snyA080VrOOfbc+M7kaJlfmjelJmVQPqeAhYvj8ad8JvkBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PJ+lC8nx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PJ+lC8nx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9246D1F00A3A;
	Tue, 14 Jul 2026 17:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784050723;
	bh=g3v01uZO4Oz40ilfrll/fmKXE/RowBk9CYi6/DwmjLE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PJ+lC8nx9aDHHcuCP2q5LSgiX5BJRlhzIls0SXa9c9W1uPFuvLFBNgomny2sj/cAC
	 8sIvJZhUQrbADsJp+aIrBBq36HmIZLq9qopFeI+j73fQt4ClI+qHcLY7BvpdtQSiTQ
	 gx8JKWUKVFLBqVZzL3XpT59kiMb/NLHyCqOYp7oyk4AggANqIjGzDpfRGEin7XpVab
	 +NRrvmyEas7cly9jiziQwK0PaLAHpmTpVcbEa5QcGiriFZZTEto8NQTa3WcGOYuwJ1
	 TnpuhgzRmVz4ae/QApdrBbOhNcXx7O0tksQhakgwhsXajfox7HQBr936LRbkLQie52
	 /eYGxRsKFLxNA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bjorn.andersson@oss.qualcomm.com,
	chris.lew@oss.qualcomm.com,
	Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Subject: Re: [PATCH] rpmsg: glink: fix deadlock in endpoint destroy during driver detach
Date: Tue, 14 Jul 2026 12:38:37 -0500
Message-ID: <178405071409.579772.15984341130781732036.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
References: <20260604-rpmsg-glink-fix-deadlock-destroy-ept-v1-1-b8a54ad1e4fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 04 Jun 2026 14:12:53 +0530, Vishnu Santhosh wrote:
> During driver detach, the device core holds the device mutex throughout
> the driver's remove callback chain.  When the rpmsg endpoint is
> destroyed as part of that teardown, the GLINK endpoint destroy
> implementation attempts to unregister the underlying rpmsg device.
> That unregistration calls device_del(), which tries to re-acquire the
> same device mutex already held higher up the stack, causing rmmod to
> hang indefinitely.
> 
> [...]

Applied, thanks!

[1/1] rpmsg: glink: fix deadlock in endpoint destroy during driver detach
      commit: 5a5a48e788e02fd8a8eb7188ce440572d6c12418

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
