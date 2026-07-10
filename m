Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F737B030;
	Fri, 10 Jul 2026 18:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706847; cv=none; b=E75vZYoWMJs8d9d94cFuUkS+UPn94+Tux0TN/fZJ+wJdfot+N4Gv4dk1Diof32Elq209zcuOITQcTatanRuSeYw4Kq+YbWp43W5C/5nz6Y6/Lu2TthLfNzyY2njU/xWqMK7eHU9YSogtGgIw8GkwkjEqdcHEyaXTOeEoU2bjTzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706847; c=relaxed/simple;
	bh=xHIwWL0dX+YWn+8QyAMd1J+rQZqZVU/cJAIObDBdM80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uhtjPbeyiEoVrr+hQfaKhTAvYEwaf0Sg7X5KqeNGqWJDuGXsrVSI/nqOUvSOwUVKTtksavyePmi4NcpGeYFVphEUc0CHdgdK3z55ZmmFayau+iF6SsgboCbYs7xezM4USaoUGUhmfm20XMx9rIoJBN06PbbMxv11ns0eeLvR4DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V3H8n1AP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V3H8n1AP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B3111F000E9;
	Fri, 10 Jul 2026 18:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706844;
	bh=6eKX8o7IaMPFMG1RzwBI922PAO9IdZivnMP6ZdfSKq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V3H8n1APnhEYIQwa3Q0JQ5iWvNpMHdydSWmCnuw3SIxSRP/Jaldxs7V3jUBAxeIzF
	 qFOs5aE20yjVDxcguvehrugqU/1/PVt+d0UxAAhfpjiLn0U79+eV/y9RmfH14XfFVS
	 oHNwtY07N2XO8/G3VPIR+dgbjE4NilwDzMjuOg9tbefQSGD0Zn4A7w3e30ZY0vBF3e
	 dQC1JTMcK/IeQBT1yxbGiO2PfV/XAnl7xIbTDXpbc5b21vR3E7LQgtz6RgTpNN02B6
	 ZolMxkxfe8PkLD7KbXLxztD8FGuo/VZYxTieF3JZJHLMBk3neCXd++Ai2y+ai7Ilk4
	 NyUpJ1nAHs/rA==
From: Bjorn Andersson <andersson@kernel.org>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	deepak.singh@oss.qualcomm.com,
	Chris Lew <christopher.lew@oss.qualcomm.com>
Subject: Re: [PATCH] rpmsg: char: Check for ongoing chrdev destroy
Date: Fri, 10 Jul 2026 13:07:08 -0500
Message-ID: <178370682984.2572738.15869457982021218567.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260406-rpmsg-char-fix-chrdev-destroy-race-v1-1-7317434fa246@oss.qualcomm.com>
References: <20260406-rpmsg-char-fix-chrdev-destroy-race-v1-1-7317434fa246@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 06 Apr 2026 09:59:50 +0530, Vishnu Santhosh wrote:
> A null pointer panic is observed when stopping a remoteproc and closing
> a character device using the RPMSG_DESTROY_EPT_IOCTL. There is a race
> where each context calls rpmsg_chrdev_eptdev_destroy(). The thread that
> runs second will call cdev_device_del() for a second time, which fails
> because the first call already removed the device from sysfs. Add a
> check at the beginning of destroy and exit early if the destroy call
> has already been done.
> 
> [...]

Applied, thanks!

[1/1] rpmsg: char: Check for ongoing chrdev destroy
      commit: 1f9c2897afb0fe86c1fdf4f5e23c5fb8f7442f6d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
