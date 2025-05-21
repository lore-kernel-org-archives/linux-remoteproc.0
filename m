Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D6D1C6FFB;
	Wed, 21 May 2025 02:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747795317; cv=none; b=ng4AO0LpNBbKYuCV+fNBI3QsnZo9dnJUXvdEuFa0BvDhScdudXpZvcQMBoqRrTx7gO358tgpYgIYvQqhSv/Wcd+Bfp0sjNRhCeRuGldRHNuCV4UNGUG1RYvI/OtS7uYD648iTW7aQj+NacjYUAPvDQUGsfOhG/RH9No36kdt85M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747795317; c=relaxed/simple;
	bh=Q8Yeq4JhkkH97YFLScpckLv71ksZIqQHpPqOlvAcZqc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eFI69zsU2RzkMd9J/JdncSNtI8le9CiJ+OIPgrInwoW8Fu/LHqdZbEg/ze2tmz5h1C8QwdSdILuxDDE0BNqU0gy5N7iNobhJv9YSLSJ8zYbS4HdLJFXe78Hwn+XleNu3S9GMpQ3lIQ8uXY+CyaDtRN0i1+SS+eKfuqEEtmSt8zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fYlrNBKn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fYlrNBKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5E8C4CEEB;
	Wed, 21 May 2025 02:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747795316;
	bh=Q8Yeq4JhkkH97YFLScpckLv71ksZIqQHpPqOlvAcZqc=;
	h=From:To:Cc:Subject:Date:From;
	b=fYlrNBKn0+I7s4QkiGORxjbZXQ5F2AkhcovkEShQLZBJe0+p2jWAYX7KWjesuTn+P
	 +PtUo6z+AV9gjKVz1FaQh0swXljpzqrpY3UgvskQXKxPZyO5gVL9rPK61S0PC+fOhJ
	 9cNHoYY3U/X5izb++W3TlyCP0/HrgqlDyVuBCaHDqlxWVW7nb8w2axavW0KOCMFXE+
	 nBQI+ohjVXuP1oGaYypCkn4xtin5nlnZJ0pgRqb2biu31pzWhSnKJVRj2Rhvdq7akP
	 SVK1qa/TCU1BbjAPCYEwlo7ckg0KMGHw4bYVmp59a4ZQhxi5pVclILMwGC9bLlbHS1
	 e3Ez/SeSoMkjQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Matti=20Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Subject: [GIT PULL] remoteproc fix for v6.15
Date: Tue, 20 May 2025 21:41:51 -0500
Message-ID: <20250521024154.1049894-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/rproc-v6.15-fixes

for you to fetch changes up to 4ca45af0a56d00b86285d6fdd720dca3215059a7:

  remoteproc: qcom_wcnss: Fix on platforms without fallback regulators (2025-05-13 10:34:33 -0500)

----------------------------------------------------------------
remoteproc fix for v6.15

Address a regression preventing the wireless subsystem remoteproc on
some Qualcomm platforms (e.g. SDM632) from working.

----------------------------------------------------------------
Matti Lehtimäki (1):
      remoteproc: qcom_wcnss: Fix on platforms without fallback regulators

 drivers/remoteproc/qcom_wcnss.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
