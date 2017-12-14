Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 13 Dec 2017 22:15:53 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [RFC 3/6] remoteproc: add system resource manager core
Message-ID: <20171214061553.GS17344@builder>
References: <1511534202-12995-1-git-send-email-arnaud.pouliquen@st.com>
 <1511534202-12995-4-git-send-email-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1511534202-12995-4-git-send-email-arnaud.pouliquen@st.com>
To: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Cc: linux-remoteproc@vger.kernel.org, Loic PALLARDY <loic.pallardy@st.com>, Fabien DESSENNE <fabien.dessenne@st.com>, Suman Anna <s-anna@ti.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Fri 24 Nov 06:36 PST 2017, Arnaud Pouliquen wrote:

> From: Fabien Dessenne <fabien.dessenne@st.com>
> 
> The remoteproc SRM (System Resource Manager) handles resources allocated
> to remote processors.
> This makes it possible for remote proc to reserve and initialize system
> resources for a peripheral assigned to a coprocessor.
> This is the core part which is in charge of controlling the device
> children.
> 

I'm afraid I find this overly complex for the task.

If we choose to describe these groups of resources like you have done
here I see no point in having the SRM core.

You could just make the SRM devices platform_drivers that acquire
handles to the resources, register (early) subdevices to get the callback
on boot/shutdown and call enable/disable on the resources there.

Regards,
Bjorn
