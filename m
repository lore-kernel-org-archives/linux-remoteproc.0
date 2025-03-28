Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561F11D5AA9;
	Fri, 28 Mar 2025 17:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743182312; cv=none; b=ShX1LEPrM/nXp9t+2iT+lYJkeDuwdzEiD0NTnKp8UNlwBaiyxZfrU2jpbp/PvGZCQJTFh9Av+YUVU2NhPY10rguEmglIys9E/CzjB0uAJDiWzU1XSs18xgaqUrJjBAThS8EDA0YT7p4GA1nZVo56bPeivKhWXC3KrXvMvJvbtsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743182312; c=relaxed/simple;
	bh=IPockx/RNCohP4hRB5I5pM9zVvxUpFQjDkYJkZy0WcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fJnxH/q2YF4fsCFbwYq1BN2IRgJdq8shfwm9YGaQpxW8EnJiqCFFJkwoKKFkVylf4FuYSb+VVi+0h58vPMeJbPtYeM+xz1V+2zCyUFkRGIGPmMRYKiJYASlKWEkR8T/YnaOCj1HB8vFSc9QxA7O0lrOG/Df510ETJnD1NtsbDSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T55fnXjy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T55fnXjy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D36DC4CEE4;
	Fri, 28 Mar 2025 17:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743182310;
	bh=IPockx/RNCohP4hRB5I5pM9zVvxUpFQjDkYJkZy0WcA=;
	h=From:To:Cc:Subject:Date:From;
	b=T55fnXjypvkgBZUK6HSeYr1iH74kguXBxtaKkn960mqQ1iZs/kjh/NXaAGU+odmCD
	 MK0tuizRR4mflEpZIbsUv5ZM0XQPlUMLUi6dRFZ0CSPQQG+h94b6Ex3eUr8lrMP2ia
	 iR6eA2fO6hSvDPEkrzFc4MLnC0HKs3z4F8ZHxvEuJY9aQ4qxo184vYwKGwcjpPEbHK
	 k4W2iyG14PRpKixiCU0ZX7KIulXc0tr1gs2t0EWbFVjGVb+zqfs34CBS4nmsdEWWDP
	 OE2B604ko4fReV39RyOzBLVGW+oO5otU6xvakPiiVwOfYABlRR7IusrBS4NG1TPcTQ
	 v58K7Me7vprgA==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr . David Alan Gilbert" <linux@treblig.org>
Subject: [GIT PULL] hwspinlock updates for v6.15
Date: Fri, 28 Mar 2025 12:18:27 -0500
Message-ID: <20250328171828.188058-1-andersson@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit a64dcfb451e254085a7daee5fe51bf22959d52d3:

  Linux 6.14-rc2 (2025-02-09 12:45:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git tags/hwlock-v6.15

for you to fetch changes up to fec04edb74126f21ac628c7be763c97deb49f69d:

  hwspinlock: Remove unused hwspin_lock_get_id() (2025-03-21 17:12:04 -0500)

----------------------------------------------------------------
hwspinlock updates for v6.15

Drop a few unused functions from the hwspinlock framework.

----------------------------------------------------------------
Dr. David Alan Gilbert (2):
      hwspinlock: Remove unused (devm_)hwspin_lock_request()
      hwspinlock: Remove unused hwspin_lock_get_id()

 Documentation/locking/hwspinlock.rst | 57 +---------------------
 drivers/hwspinlock/hwspinlock_core.c | 94 ------------------------------------
 include/linux/hwspinlock.h           | 18 -------
 3 files changed, 1 insertion(+), 168 deletions(-)
