Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 7 Feb 2018 07:27:53 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] remoteproc: Remove null character write of shared mem
Message-ID: <20180207152753.GO9465@builder>
References: <1518009762-26480-1-git-send-email-shajit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1518009762-26480-1-git-send-email-shajit@codeaurora.org>
To: Jitendra Sharma <shajit@codeaurora.org>
Cc: linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 07 Feb 05:22 PST 2018, Jitendra Sharma wrote:

> remoteproc is writing '\0' in the shared mem region. This
> region is shared among multiple clients that are also trying
> to read. Hence they miss first character.
> 
> Remove this null character write, as this mem area is
> supposed to be Read only.
> 
> Further during every subsystem reboot, this region is
> initialized with default, hence no need to write this
> region.

Thanks for your patch Jitendra!

The write was removed from the downstream kernel in msm-4.9, late last
year. Can you please confirm that you describe here is valid for
platforms supported prior to this change as well?

E.g. is what you're describing true for wcnss on 8064, adsp on 8974 and
mpss on 8916?

Regards,
Bjorn
