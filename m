Return-Path: <bjorn.andersson@linaro.org>
Date: Mon, 15 Jan 2018 09:30:52 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 0/8] Remoteproc cleanups
Message-ID: <20180115173052.GY17344@builder>
References: <20180105235805.9948-1-bjorn.andersson@linaro.org>
 <876e3f0622504971b17e3e3bac99d8fd@SFHDAG7NODE2.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <876e3f0622504971b17e3e3bac99d8fd@SFHDAG7NODE2.st.com>
To: Loic PALLARDY <loic.pallardy@st.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 15 Jan 02:35 PST 2018, Loic PALLARDY wrote:

> 
> 
> > -----Original Message-----
> > From: Bjorn Andersson [mailto:bjorn.andersson@linaro.org]
> > Sent: Saturday, January 06, 2018 12:58 AM
> > To: Ohad Ben-Cohen <ohad@wizery.com>; Bjorn Andersson
> > <bjorn.andersson@linaro.org>
> > Cc: linux-remoteproc@vger.kernel.org; linux-kernel@vger.kernel.org; Loic
> > PALLARDY <loic.pallardy@st.com>
> > Subject: [PATCH v2 0/8] Remoteproc cleanups
> > 
> > The first patch removes code that became unnecessary when the recovery
> > flow was
> > redesigned.
> > 
> > The following patches moves the assignment of cached_table to the
> > resource
> > table loader, rather than core code, which allows this to made optional and
> > finally drops the various dummy resource tables provided by drivers.
> > 
> > Then finally the last patch ensures that table_ptr isn't left pointing into
> > memory of a stopped remoteproc.
> 
> I have tested this series on B2260 96Board for st-slim remote processor support.
> 
> Reviewed-By: Loic Pallardy <loic.pallardy@st.com>
> Tested-By: Loic Pallardy <loic.pallardy@st.com>
> 

Thanks Loic, very much appreciate you looking into this!

Regards,
Bjorn
