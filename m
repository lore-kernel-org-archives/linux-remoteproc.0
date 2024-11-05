Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D05B1FC3;
	Tue,  5 Nov 2024 00:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730767677; cv=none; b=YeSF20CwW4Jd4fizcGOizDWmM9EbqU1o7LWQwrr0GSydTBZIj8GrKNq40bzhBrm/MNeoG1SEmJxop2nEg0LXt1qqqjrrc9psHBg7RF7UvICCYfwyzFnLeQF8rgokdunAK1hRNiig70a5q3XyPBIhmWaXCF9ZX5L2oEs4aNE9f48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730767677; c=relaxed/simple;
	bh=4dganhI8aKL/WLYNHxCNqDeC8khXLNgB+BsnB6sBxHc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OVsHdZmghA/F4XiwUZWC4y6AFC3ZIVe3Ek8WkNjdw7dAiFXRIayPfcb1RiEnf8WjBgjZJqfM5kYXtTO89ofTSDZxSvHc097JRhP8jAuvoP9MTHn9s3bP3qhnyT3r5D9Hdn5spi2lFcigoj6ehbiyj8Jt3bWKINDBvJBSwWL3wbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TTgTCZQ7; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TTgTCZQ7"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3e612437c09so2893548b6e.2;
        Mon, 04 Nov 2024 16:47:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730767675; x=1731372475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dganhI8aKL/WLYNHxCNqDeC8khXLNgB+BsnB6sBxHc=;
        b=TTgTCZQ7P+GFvpqU3VtC32yu6/F/Kpmddf3D2ojnxktjma82o7W5QFkgjH+UWJe5rk
         LUHgOtjNCedQqfCzlLf1XcnoSD6pbjRjO/fN4zd+FmPLm0hkRsCcg2AcYgS9zCK5ZzyX
         RoHEPfVarwwxcx3QNcoyip4deyShYwFQUeFutjbCqN6e1TSbrRhskd/jUqr5xfK1wdMC
         2wWsl2/2gJfSuRL5q86D9cAC4Gq0y4vGBiAWXvxF6Q+ShexcBQpf8AyqQ41x8Fuq6Z52
         xbJo6MYmTQCSVABeFXLLw7Nlp9xuzF/SCkbFgZZOJsz1hzo0i5kgUPvl6JTH6lVZwz6S
         r56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730767675; x=1731372475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dganhI8aKL/WLYNHxCNqDeC8khXLNgB+BsnB6sBxHc=;
        b=N7pOHELS0t72qe8eTkkvHg+93LEsD+Z/PrusMRsMsWPrp4ZrSuvLYoFHA9JZ7E1cNr
         /rqmvNvqTHYOSVwdS6VCZYRa1Gd5BenLDd7tlswbjuDm4TejaYar73q6k9qLixReUsGt
         7j56/BgdGG7TFBLcqLjLJyNURlYvqUL0T6zpl6pHPCJVVsWiJqxCtpe/rZqzfljIpnUJ
         8vuWDpgLdZA7Umd174yo/0HLkCVGstp+nzSwaxiNUwSXtkzDtZmtatmNeotuBvTW9Gsq
         HLFjqZ2R2s8GdkzQzfmqIU7w8474eFl9CVe8QaS+JxpPKFEJuPkXDosZCpkguTZvMqTN
         MTkA==
X-Forwarded-Encrypted: i=1; AJvYcCU+CcuCeWGg/d0nuBEkdLr0igxTxpERM8NIdGiDr5t5ikoqdZzz59sUFqpbkVKGrCeczApc0Iibxt38nm8iiBsdMw==@vger.kernel.org, AJvYcCXXRNowrsYhiab67W5kfRxjXaY6xsNpzMgCCg8AQsL7z72O4Q9X0PRGFwWmcw9NOnq2Vi3FuZW4mdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB/Qv8t5Wo0JIHyL7vBs/zYKM9Cs604QnkZNeI7uow7jki5FYf
	wKgqmKBcP0NaFkLrSkfvs1BnTQ5wDvsSEYMfBABUk6OdPJVjuM5L
X-Google-Smtp-Source: AGHT+IGyZo9TmRQEI0XfgJ2FBNrT/1OHvFB3HFtCD9nV6uDsjfO67ZAjSE1DvmbZU86OtDIiPfWF0g==
X-Received: by 2002:a05:6808:3c4c:b0:3e6:5a7f:e102 with SMTP id 5614622812f47-3e65a7fe27bmr17478693b6e.9.1730767675051;
        Mon, 04 Nov 2024 16:47:55 -0800 (PST)
Received: from anishs-Air.attlocal.net ([2600:1700:3bdc:8c10:d414:4f86:7740:65e1])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e661190d07sm2317994b6e.11.2024.11.04.16.47.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 04 Nov 2024 16:47:53 -0800 (PST)
From: anish kumar <yesanishhere@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	corbet@lwn.net
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 0/3] Documentation: remoteproc: update various sections 
Date: Mon,  4 Nov 2024 16:47:46 -0800
Message-Id: <20241105004749.83424-1-yesanishhere@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

V6:
divided the patches for each section as suggested by mathieu.
First patch is updating introduction section
second patch is for new overview section as suggested
third patch is for devm version of rprod_add

V5:
based on comment from mathieu poirier, remove all files
and combined that in the original file and as he adviced
nothing with respect to old documentation was changed.

V4:
Fixed compilation errors and moved documentation to
driver-api directory.

V3:
Seperated out the patches further to make the intention
clear for each patch.

V2:
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202410161444.jOKMsoGS-lkp@intel.com/

Hi Mathieu,

Hopefully this time around, I have not messed up
patches. I have created three patches.

Thanks,
anish
